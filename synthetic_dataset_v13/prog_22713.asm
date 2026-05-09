; DESCRIPTION: Places a orange line segment connecting (291, 180) to (435, 51).
; PLAN: r0=291(x1), r1=180(y1), r2=435(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 180
LDI r2, 435
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
