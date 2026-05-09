; DESCRIPTION: Draws a green line from (11, 179) to (34, 87).
; PLAN: r0=11(x1), r1=179(y1), r2=34(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 179
LDI r2, 34
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
