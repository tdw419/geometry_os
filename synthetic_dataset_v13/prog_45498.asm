; DESCRIPTION: Draws a orange line from (322, 174) to (381, 224).
; PLAN: r0=322(x1), r1=174(y1), r2=381(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 174
LDI r2, 381
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
