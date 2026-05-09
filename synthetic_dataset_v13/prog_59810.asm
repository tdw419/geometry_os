; DESCRIPTION: Renders a blue line between points (183, 180) and (327, 20).
; PLAN: r0=183(x1), r1=180(y1), r2=327(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 180
LDI r2, 327
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
