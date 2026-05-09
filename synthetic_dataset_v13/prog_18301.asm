; DESCRIPTION: Renders a orange line between points (174, 140) and (48, 251).
; PLAN: r0=174(x1), r1=140(y1), r2=48(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 140
LDI r2, 48
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
