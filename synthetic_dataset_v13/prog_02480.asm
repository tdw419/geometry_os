; DESCRIPTION: Draws a white line from (81, 97) to (99, 69).
; PLAN: r0=81(x1), r1=97(y1), r2=99(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 97
LDI r2, 99
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
