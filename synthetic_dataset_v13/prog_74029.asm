; DESCRIPTION: Renders a orange line between points (108, 27) and (11, 40).
; PLAN: r0=108(x1), r1=27(y1), r2=11(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 27
LDI r2, 11
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
