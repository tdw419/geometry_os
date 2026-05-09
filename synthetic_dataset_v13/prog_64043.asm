; DESCRIPTION: Composite: Places a blue 62x89 rectangle at position (17, 141) then Draws a yellow line from (442, 201) to (265, 219).
; PLAN: r0=17(x), r1=141(y), r2=62(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x1), r6=201(y1), r7=265(x2), r8=219(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 141
LDI r2, 62
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 201
LDI r7, 265
LDI r8, 219
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
