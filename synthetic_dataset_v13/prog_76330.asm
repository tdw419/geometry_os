; DESCRIPTION: Composite: Places a white line segment connecting (75, 245) to (19, 142) then Renders a blue box of size 48x105 starting at (170, 104) then Sets a single cyan pixel at (249, 142).
; PLAN: r0=75(x1), r1=245(y1), r2=19(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=104(y), r7=48(width), r8=105(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=249(x), r11=142(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 75
LDI r1, 245
LDI r2, 19
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 104
LDI r7, 48
LDI r8, 105
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 142
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
