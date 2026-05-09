; DESCRIPTION: Draws a white line from (61, 15) to (101, 33).
; PLAN: r0=61(x1), r1=15(y1), r2=101(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 15
LDI r2, 101
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
