; DESCRIPTION: Renders a orange line between points (322, 114) and (425, 137).
; PLAN: r0=322(x1), r1=114(y1), r2=425(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 114
LDI r2, 425
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
