; DESCRIPTION: Places a orange line segment connecting (24, 243) to (227, 113).
; PLAN: r0=24(x1), r1=243(y1), r2=227(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 243
LDI r2, 227
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
