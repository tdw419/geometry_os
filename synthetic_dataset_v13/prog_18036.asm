; DESCRIPTION: Draws a blue line from (18, 42) to (432, 227).
; PLAN: r0=18(x1), r1=42(y1), r2=432(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 42
LDI r2, 432
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
