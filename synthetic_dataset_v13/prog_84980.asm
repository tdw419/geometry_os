; DESCRIPTION: Draws a green line from (9, 176) to (30, 66).
; PLAN: r0=9(x1), r1=176(y1), r2=30(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 176
LDI r2, 30
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
