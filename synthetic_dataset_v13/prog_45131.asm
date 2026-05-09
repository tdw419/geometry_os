; DESCRIPTION: Places a yellow line segment connecting (265, 114) to (343, 124).
; PLAN: r0=265(x1), r1=114(y1), r2=343(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 114
LDI r2, 343
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
