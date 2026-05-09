; DESCRIPTION: Renders a green line between points (148, 247) and (491, 180).
; PLAN: r0=148(x1), r1=247(y1), r2=491(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 247
LDI r2, 491
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
