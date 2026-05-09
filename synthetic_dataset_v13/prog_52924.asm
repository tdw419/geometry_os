; DESCRIPTION: Draws a yellow line from (449, 37) to (191, 104).
; PLAN: r0=449(x1), r1=37(y1), r2=191(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 37
LDI r2, 191
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
