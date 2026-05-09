; DESCRIPTION: Renders a purple line between points (487, 172) and (464, 116).
; PLAN: r0=487(x1), r1=172(y1), r2=464(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 172
LDI r2, 464
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
