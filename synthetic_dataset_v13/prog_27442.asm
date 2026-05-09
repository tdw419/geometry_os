; DESCRIPTION: Renders a orange line between points (399, 49) and (198, 38).
; PLAN: r0=399(x1), r1=49(y1), r2=198(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 49
LDI r2, 198
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
