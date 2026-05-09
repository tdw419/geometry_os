; DESCRIPTION: Renders a orange line between points (64, 27) and (10, 21).
; PLAN: r0=64(x1), r1=27(y1), r2=10(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 27
LDI r2, 10
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
