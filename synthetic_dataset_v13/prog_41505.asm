; DESCRIPTION: Renders a black line between points (291, 60) and (84, 239).
; PLAN: r0=291(x1), r1=60(y1), r2=84(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 60
LDI r2, 84
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
