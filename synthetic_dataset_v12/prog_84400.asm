; DESCRIPTION: Renders a black line between points (103, 196) and (106, 194).
; PLAN: r0=103(x1), r1=196(y1), r2=106(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 196
LDI r2, 106
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
