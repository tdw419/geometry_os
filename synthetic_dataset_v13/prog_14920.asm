; DESCRIPTION: Composite: Draws a green line from (133, 94) to (2, 197) then Places a blue circle of radius 17 at center (198, 47).
; PLAN: r0=133(x1), r1=94(y1), r2=2(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=47(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 94
LDI r2, 2
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 47
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
