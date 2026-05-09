; DESCRIPTION: Renders a magenta line between points (77, 83) and (165, 180).
; PLAN: r0=77(x1), r1=83(y1), r2=165(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 83
LDI r2, 165
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
