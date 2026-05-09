; DESCRIPTION: Renders a orange line between points (111, 114) and (101, 177).
; PLAN: r0=111(x1), r1=114(y1), r2=101(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 114
LDI r2, 101
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
