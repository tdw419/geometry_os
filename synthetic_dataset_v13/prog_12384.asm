; DESCRIPTION: Composite: Renders a blue line between points (25, 242) and (296, 112) then Sets a single white pixel at (290, 106) then Draws a cyan rectangle at (417, 148) with width 14 and height 22.
; PLAN: r0=25(x1), r1=242(y1), r2=296(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=106(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=417(x), r11=148(y), r12=14(width), r13=22(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 242
LDI r2, 296
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 106
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 417
LDI r11, 148
LDI r12, 14
LDI r13, 22
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
