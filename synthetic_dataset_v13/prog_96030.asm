; DESCRIPTION: Draws a green line from (156, 179) to (67, 105).
; PLAN: r0=156(x1), r1=179(y1), r2=67(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 179
LDI r2, 67
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
