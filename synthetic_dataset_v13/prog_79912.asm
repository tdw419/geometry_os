; DESCRIPTION: Renders a orange line between points (264, 140) and (32, 249).
; PLAN: r0=264(x1), r1=140(y1), r2=32(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 140
LDI r2, 32
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
