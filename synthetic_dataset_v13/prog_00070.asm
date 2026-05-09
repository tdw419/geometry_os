; DESCRIPTION: Draws a green line from (195, 26) to (80, 100).
; PLAN: r0=195(x1), r1=26(y1), r2=80(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 26
LDI r2, 80
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
