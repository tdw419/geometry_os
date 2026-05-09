; DESCRIPTION: Renders a orange line between points (491, 30) and (354, 2).
; PLAN: r0=491(x1), r1=30(y1), r2=354(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 30
LDI r2, 354
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
