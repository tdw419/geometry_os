; DESCRIPTION: Draws a green line from (19, 179) to (341, 89).
; PLAN: r0=19(x1), r1=179(y1), r2=341(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 179
LDI r2, 341
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
