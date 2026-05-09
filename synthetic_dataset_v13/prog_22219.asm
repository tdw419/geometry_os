; DESCRIPTION: Draws a white line from (258, 156) to (38, 133).
; PLAN: r0=258(x1), r1=156(y1), r2=38(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 156
LDI r2, 38
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
