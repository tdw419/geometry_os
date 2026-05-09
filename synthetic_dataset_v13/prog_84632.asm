; DESCRIPTION: Composite: Renders a blue line between points (24, 54) and (131, 11) then Places a magenta circle of radius 23 at center (392, 105).
; PLAN: r0=24(x1), r1=54(y1), r2=131(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=105(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 24
LDI r1, 54
LDI r2, 131
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 105
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
