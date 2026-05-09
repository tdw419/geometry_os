; DESCRIPTION: Places a orange line segment connecting (237, 130) to (50, 51).
; PLAN: r0=237(x1), r1=130(y1), r2=50(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 130
LDI r2, 50
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
