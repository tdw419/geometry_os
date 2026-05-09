; DESCRIPTION: Draws a orange line from (469, 196) to (58, 106).
; PLAN: r0=469(x1), r1=196(y1), r2=58(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 196
LDI r2, 58
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
