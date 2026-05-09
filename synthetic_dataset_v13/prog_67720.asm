; DESCRIPTION: Renders a orange line between points (302, 65) and (493, 252).
; PLAN: r0=302(x1), r1=65(y1), r2=493(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 65
LDI r2, 493
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
