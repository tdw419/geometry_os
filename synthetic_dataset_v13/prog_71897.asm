; DESCRIPTION: Draws a orange line from (373, 140) to (380, 250).
; PLAN: r0=373(x1), r1=140(y1), r2=380(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 140
LDI r2, 380
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
