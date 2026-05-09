; DESCRIPTION: Renders a black line between points (510, 184) and (219, 30).
; PLAN: r0=510(x1), r1=184(y1), r2=219(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 184
LDI r2, 219
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
