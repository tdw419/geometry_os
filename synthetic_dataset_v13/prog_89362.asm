; DESCRIPTION: Renders a yellow line between points (463, 196) and (79, 25).
; PLAN: r0=463(x1), r1=196(y1), r2=79(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 196
LDI r2, 79
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
