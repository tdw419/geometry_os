; DESCRIPTION: Renders a yellow line between points (183, 114) and (433, 31).
; PLAN: r0=183(x1), r1=114(y1), r2=433(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 114
LDI r2, 433
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
