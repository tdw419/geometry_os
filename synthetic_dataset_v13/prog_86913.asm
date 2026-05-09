; DESCRIPTION: Composite: Places a blue dot at position (218, 51) then Renders a purple line between points (129, 29) and (131, 207).
; PLAN: r0=218(x), r1=51(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=129(x1), r6=29(y1), r7=131(x2), r8=207(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 51
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 129
LDI r6, 29
LDI r7, 131
LDI r8, 207
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
