; DESCRIPTION: Draws a green line from (449, 152) to (119, 106).
; PLAN: r0=449(x1), r1=152(y1), r2=119(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 152
LDI r2, 119
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
