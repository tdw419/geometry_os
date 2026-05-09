; DESCRIPTION: Renders a blue line between points (220, 86) and (348, 50).
; PLAN: r0=220(x1), r1=86(y1), r2=348(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 86
LDI r2, 348
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
