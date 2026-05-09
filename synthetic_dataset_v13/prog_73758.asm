; DESCRIPTION: Renders a orange line between points (280, 140) and (123, 128).
; PLAN: r0=280(x1), r1=140(y1), r2=123(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 140
LDI r2, 123
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
