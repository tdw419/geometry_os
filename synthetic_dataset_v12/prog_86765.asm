; DESCRIPTION: Composite: Draws a yellow line from (176, 251) to (344, 250) then Creates a blue circular shape at (402, 94) with radius 67.
; PLAN: r0=176(x1), r1=251(y1), r2=344(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=94(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 251
LDI r2, 344
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 94
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
