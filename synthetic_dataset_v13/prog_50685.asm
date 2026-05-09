; DESCRIPTION: Draws a red line from (167, 148) to (97, 84).
; PLAN: r0=167(x1), r1=148(y1), r2=97(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 148
LDI r2, 97
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
