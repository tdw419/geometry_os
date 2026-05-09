; DESCRIPTION: Draws a orange line from (169, 126) to (384, 1).
; PLAN: r0=169(x1), r1=126(y1), r2=384(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 126
LDI r2, 384
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
