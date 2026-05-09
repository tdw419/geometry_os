; DESCRIPTION: Draws a orange line from (458, 163) to (264, 83).
; PLAN: r0=458(x1), r1=163(y1), r2=264(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 163
LDI r2, 264
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
