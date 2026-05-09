; DESCRIPTION: Draws a green line from (345, 65) to (3, 252).
; PLAN: r0=345(x1), r1=65(y1), r2=3(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 65
LDI r2, 3
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
