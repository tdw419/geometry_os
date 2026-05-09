; DESCRIPTION: Composite: Places a magenta line segment connecting (463, 135) to (449, 121) then Sets a single purple pixel at (159, 253).
; PLAN: r0=463(x1), r1=135(y1), r2=449(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=253(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 463
LDI r1, 135
LDI r2, 449
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 253
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
