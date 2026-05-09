; DESCRIPTION: Draws a white line from (167, 148) to (431, 99).
; PLAN: r0=167(x1), r1=148(y1), r2=431(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 148
LDI r2, 431
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
