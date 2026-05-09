; DESCRIPTION: Renders a yellow line between points (383, 183) and (234, 114).
; PLAN: r0=383(x1), r1=183(y1), r2=234(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 183
LDI r2, 234
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
