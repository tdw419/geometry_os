; DESCRIPTION: Places a orange line segment connecting (274, 140) to (213, 75).
; PLAN: r0=274(x1), r1=140(y1), r2=213(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 140
LDI r2, 213
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
