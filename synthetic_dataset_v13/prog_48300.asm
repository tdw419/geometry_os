; DESCRIPTION: Renders a blue line between points (226, 151) and (61, 18).
; PLAN: r0=226(x1), r1=151(y1), r2=61(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 151
LDI r2, 61
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
