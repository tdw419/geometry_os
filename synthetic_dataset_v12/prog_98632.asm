; DESCRIPTION: Renders a blue line between points (172, 210) and (492, 105).
; PLAN: r0=172(x1), r1=210(y1), r2=492(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 210
LDI r2, 492
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
