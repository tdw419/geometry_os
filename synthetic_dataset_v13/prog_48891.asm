; DESCRIPTION: Draws a green line from (461, 117) to (227, 73).
; PLAN: r0=461(x1), r1=117(y1), r2=227(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 117
LDI r2, 227
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
