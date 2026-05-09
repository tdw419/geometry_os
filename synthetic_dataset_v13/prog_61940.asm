; DESCRIPTION: Renders a orange line between points (365, 130) and (418, 196).
; PLAN: r0=365(x1), r1=130(y1), r2=418(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 130
LDI r2, 418
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
