; DESCRIPTION: Renders a orange line between points (481, 28) and (254, 8).
; PLAN: r0=481(x1), r1=28(y1), r2=254(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 28
LDI r2, 254
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
