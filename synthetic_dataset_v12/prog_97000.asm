; DESCRIPTION: Composite: Draws a blue line from (480, 14) to (433, 125) then Places a black circle of radius 29 at center (155, 52).
; PLAN: r0=480(x1), r1=14(y1), r2=433(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=52(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 480
LDI r1, 14
LDI r2, 433
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 52
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
