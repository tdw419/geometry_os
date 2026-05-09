; DESCRIPTION: Draws a white line from (511, 21) to (22, 157).
; PLAN: r0=511(x1), r1=21(y1), r2=22(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 21
LDI r2, 22
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
