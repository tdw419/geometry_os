; DESCRIPTION: Composite: Renders a yellow line between points (506, 78) and (448, 222) then Places a blue dot at position (142, 67).
; PLAN: r0=506(x1), r1=78(y1), r2=448(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=67(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 506
LDI r1, 78
LDI r2, 448
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 67
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
