; DESCRIPTION: Draws a orange line from (483, 107) to (360, 163).
; PLAN: r0=483(x1), r1=107(y1), r2=360(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 107
LDI r2, 360
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
