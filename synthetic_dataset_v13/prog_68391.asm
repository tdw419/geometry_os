; DESCRIPTION: Composite: Places a magenta 22x109 rectangle at position (125, 24) then Draws a magenta line from (426, 105) to (274, 91) then Places a green circle of radius 29 at center (176, 64).
; PLAN: r0=125(x), r1=24(y), r2=22(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x1), r6=105(y1), r7=274(x2), r8=91(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=176(x), r11=64(y), r12=29(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 24
LDI r2, 22
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 105
LDI r7, 274
LDI r8, 91
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 64
LDI r12, 29
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
