; DESCRIPTION: Renders a blue line between points (466, 199) and (434, 113).
; PLAN: r0=466(x1), r1=199(y1), r2=434(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 199
LDI r2, 434
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
