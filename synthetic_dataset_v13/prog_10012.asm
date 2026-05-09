; DESCRIPTION: Places a orange line segment connecting (43, 243) to (28, 24).
; PLAN: r0=43(x1), r1=243(y1), r2=28(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 243
LDI r2, 28
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
