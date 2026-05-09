; DESCRIPTION: Renders a blue line between points (153, 120) and (399, 143).
; PLAN: r0=153(x1), r1=120(y1), r2=399(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 120
LDI r2, 399
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
