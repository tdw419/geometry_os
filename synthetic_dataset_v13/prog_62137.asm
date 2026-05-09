; DESCRIPTION: Renders a orange line between points (64, 130) and (265, 108).
; PLAN: r0=64(x1), r1=130(y1), r2=265(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 130
LDI r2, 265
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
