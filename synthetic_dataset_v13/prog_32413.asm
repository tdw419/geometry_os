; DESCRIPTION: Renders a orange line between points (492, 0) and (459, 196).
; PLAN: r0=492(x1), r1=0(y1), r2=459(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 0
LDI r2, 459
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
