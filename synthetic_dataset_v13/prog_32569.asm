; DESCRIPTION: Draws a green line from (323, 97) to (154, 45).
; PLAN: r0=323(x1), r1=97(y1), r2=154(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 97
LDI r2, 154
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
