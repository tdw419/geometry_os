; DESCRIPTION: Places a orange line segment connecting (469, 215) to (486, 28).
; PLAN: r0=469(x1), r1=215(y1), r2=486(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 215
LDI r2, 486
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
