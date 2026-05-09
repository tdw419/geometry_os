; DESCRIPTION: Draws a white line from (28, 26) to (414, 15).
; PLAN: r0=28(x1), r1=26(y1), r2=414(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 26
LDI r2, 414
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
