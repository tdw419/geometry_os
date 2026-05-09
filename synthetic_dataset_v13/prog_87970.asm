; DESCRIPTION: Renders a white line between points (29, 34) and (196, 194).
; PLAN: r0=29(x1), r1=34(y1), r2=196(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 34
LDI r2, 196
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
