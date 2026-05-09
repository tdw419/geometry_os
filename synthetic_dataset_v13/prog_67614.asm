; DESCRIPTION: Draws a green line from (151, 192) to (207, 179).
; PLAN: r0=151(x1), r1=192(y1), r2=207(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 192
LDI r2, 207
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
