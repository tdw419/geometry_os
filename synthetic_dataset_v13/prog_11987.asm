; DESCRIPTION: Composite: Renders a white box of size 78x45 starting at (275, 152) then Renders a blue line between points (462, 139) and (92, 30) then Sets a single cyan pixel at (353, 97).
; PLAN: r0=275(x), r1=152(y), r2=78(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x1), r6=139(y1), r7=92(x2), r8=30(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=97(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 275
LDI r1, 152
LDI r2, 78
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 139
LDI r7, 92
LDI r8, 30
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 97
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
