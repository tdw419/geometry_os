; DESCRIPTION: Composite: Places a magenta circle of radius 51 at center (120, 164) then Renders a black line between points (94, 60) and (385, 105).
; PLAN: r0=120(x), r1=164(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x1), r6=60(y1), r7=385(x2), r8=105(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 164
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 60
LDI r7, 385
LDI r8, 105
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
