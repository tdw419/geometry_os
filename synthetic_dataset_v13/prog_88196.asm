; DESCRIPTION: Renders a orange line between points (140, 120) and (48, 112).
; PLAN: r0=140(x1), r1=120(y1), r2=48(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 120
LDI r2, 48
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
