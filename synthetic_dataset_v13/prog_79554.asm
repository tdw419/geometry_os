; DESCRIPTION: Renders a blue line between points (6, 61) and (305, 180).
; PLAN: r0=6(x1), r1=61(y1), r2=305(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 61
LDI r2, 305
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
