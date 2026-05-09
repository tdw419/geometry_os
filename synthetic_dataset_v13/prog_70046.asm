; DESCRIPTION: Renders a orange line between points (95, 32) and (99, 108).
; PLAN: r0=95(x1), r1=32(y1), r2=99(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 32
LDI r2, 99
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
