; DESCRIPTION: Renders a blue line between points (329, 138) and (434, 180).
; PLAN: r0=329(x1), r1=138(y1), r2=434(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 138
LDI r2, 434
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
