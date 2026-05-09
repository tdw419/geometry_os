; DESCRIPTION: Composite: Places a blue line segment connecting (73, 153) to (99, 34) then Places a black dot at position (103, 19).
; PLAN: r0=73(x1), r1=153(y1), r2=99(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=19(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 73
LDI r1, 153
LDI r2, 99
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 19
LDI r7, 0x000000
PSET r5, r6, r7
HALT
