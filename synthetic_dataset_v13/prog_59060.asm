; DESCRIPTION: Composite: Places a blue dot at position (412, 141) then Renders a orange line between points (123, 136) and (390, 238).
; PLAN: r0=412(x), r1=141(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=123(x1), r6=136(y1), r7=390(x2), r8=238(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 141
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 123
LDI r6, 136
LDI r7, 390
LDI r8, 238
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
