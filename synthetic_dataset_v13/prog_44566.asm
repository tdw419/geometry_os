; DESCRIPTION: Renders a white line between points (219, 185) and (35, 5).
; PLAN: r0=219(x1), r1=185(y1), r2=35(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 185
LDI r2, 35
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
