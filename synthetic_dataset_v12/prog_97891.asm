; DESCRIPTION: Composite: Renders a green line between points (256, 231) and (476, 148) then Draws a blue circle centered at (164, 84) with radius 43.
; PLAN: r0=256(x1), r1=231(y1), r2=476(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=84(y), r7=43(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 256
LDI r1, 231
LDI r2, 476
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 84
LDI r7, 43
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
