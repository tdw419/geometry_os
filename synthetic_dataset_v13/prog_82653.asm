; DESCRIPTION: Composite: Renders a white box of size 113x99 starting at (266, 80) then Renders a magenta line between points (319, 88) and (287, 153) then Places a green dot at position (71, 161).
; PLAN: r0=266(x), r1=80(y), r2=113(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x1), r6=88(y1), r7=287(x2), r8=153(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=71(x), r11=161(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 80
LDI r2, 113
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 88
LDI r7, 287
LDI r8, 153
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 161
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
