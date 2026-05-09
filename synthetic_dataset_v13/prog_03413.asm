; DESCRIPTION: Renders a orange line between points (378, 149) and (117, 208).
; PLAN: r0=378(x1), r1=149(y1), r2=117(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 149
LDI r2, 117
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
