; DESCRIPTION: Places a orange line segment connecting (445, 171) to (147, 153).
; PLAN: r0=445(x1), r1=171(y1), r2=147(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 171
LDI r2, 147
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
