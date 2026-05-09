; DESCRIPTION: Composite: Draws a red rectangle at (201, 126) with width 58 and height 98 then Draws a magenta line from (150, 9) to (135, 132) then Renders a black disk with center (238, 86) and radius 39.
; PLAN: r0=201(x), r1=126(y), r2=58(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x1), r6=9(y1), r7=135(x2), r8=132(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=238(x), r11=86(y), r12=39(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 126
LDI r2, 58
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 9
LDI r7, 135
LDI r8, 132
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 86
LDI r12, 39
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
