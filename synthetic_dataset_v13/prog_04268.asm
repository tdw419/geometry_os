; DESCRIPTION: Renders a orange line between points (291, 58) and (440, 1).
; PLAN: r0=291(x1), r1=58(y1), r2=440(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 58
LDI r2, 440
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
