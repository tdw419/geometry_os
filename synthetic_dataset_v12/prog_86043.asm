; DESCRIPTION: Renders a blue line between points (47, 116) and (308, 57).
; PLAN: r0=47(x1), r1=116(y1), r2=308(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 116
LDI r2, 308
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
