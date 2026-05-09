; DESCRIPTION: Composite: Draws a purple line from (74, 198) to (494, 185) then Places a blue circle of radius 54 at center (329, 150).
; PLAN: r0=74(x1), r1=198(y1), r2=494(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=150(y), r7=54(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 74
LDI r1, 198
LDI r2, 494
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 150
LDI r7, 54
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
