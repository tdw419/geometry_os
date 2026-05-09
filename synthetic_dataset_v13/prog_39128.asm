; DESCRIPTION: Places a orange line segment connecting (458, 142) to (394, 51).
; PLAN: r0=458(x1), r1=142(y1), r2=394(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 142
LDI r2, 394
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
