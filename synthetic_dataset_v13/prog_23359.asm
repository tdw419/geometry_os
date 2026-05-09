; DESCRIPTION: Renders a white line between points (149, 12) and (26, 196).
; PLAN: r0=149(x1), r1=12(y1), r2=26(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 12
LDI r2, 26
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
