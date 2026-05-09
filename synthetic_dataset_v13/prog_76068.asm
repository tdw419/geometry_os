; DESCRIPTION: Composite: Draws a purple line from (506, 10) to (453, 227) then Places a black dot at position (121, 218).
; PLAN: r0=506(x1), r1=10(y1), r2=453(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=218(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 506
LDI r1, 10
LDI r2, 453
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 218
LDI r7, 0x000000
PSET r5, r6, r7
HALT
