; DESCRIPTION: Renders a orange line between points (62, 96) and (108, 132).
; PLAN: r0=62(x1), r1=96(y1), r2=108(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 96
LDI r2, 108
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
