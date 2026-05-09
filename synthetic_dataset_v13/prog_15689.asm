; DESCRIPTION: Draws a green line from (131, 30) to (106, 26).
; PLAN: r0=131(x1), r1=30(y1), r2=106(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 30
LDI r2, 106
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
