; DESCRIPTION: Draws a green line from (429, 154) to (119, 105).
; PLAN: r0=429(x1), r1=154(y1), r2=119(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 154
LDI r2, 119
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
