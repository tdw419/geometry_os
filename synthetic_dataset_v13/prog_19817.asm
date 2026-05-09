; DESCRIPTION: Renders a black line between points (260, 5) and (485, 100).
; PLAN: r0=260(x1), r1=5(y1), r2=485(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 5
LDI r2, 485
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
