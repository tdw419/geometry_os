; DESCRIPTION: Renders a orange line between points (36, 32) and (355, 65).
; PLAN: r0=36(x1), r1=32(y1), r2=355(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 32
LDI r2, 355
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
