; DESCRIPTION: Draws a white line from (12, 181) to (355, 26).
; PLAN: r0=12(x1), r1=181(y1), r2=355(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 181
LDI r2, 355
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
