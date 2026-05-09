; DESCRIPTION: Draws a green line from (230, 100) to (117, 148).
; PLAN: r0=230(x1), r1=100(y1), r2=117(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 100
LDI r2, 117
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
