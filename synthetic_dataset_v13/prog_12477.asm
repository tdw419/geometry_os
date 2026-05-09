; DESCRIPTION: Places a orange line segment connecting (102, 236) to (346, 191).
; PLAN: r0=102(x1), r1=236(y1), r2=346(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 236
LDI r2, 346
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
