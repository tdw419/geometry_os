; DESCRIPTION: Renders a blue line between points (320, 74) and (146, 78).
; PLAN: r0=320(x1), r1=74(y1), r2=146(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 74
LDI r2, 146
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
