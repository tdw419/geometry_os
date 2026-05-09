; DESCRIPTION: Draws a green line from (56, 49) to (157, 141).
; PLAN: r0=56(x1), r1=49(y1), r2=157(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 49
LDI r2, 157
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
