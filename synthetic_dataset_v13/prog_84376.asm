; DESCRIPTION: Composite: Places a green dot at position (186, 207) then Renders a white box of size 106x13 starting at (109, 1) then Renders a cyan line between points (335, 7) and (107, 184).
; PLAN: r0=186(x), r1=207(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=109(x), r6=1(y), r7=106(width), r8=13(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x1), r11=7(y1), r12=107(x2), r13=184(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 207
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 109
LDI r6, 1
LDI r7, 106
LDI r8, 13
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 7
LDI r12, 107
LDI r13, 184
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
