; DESCRIPTION: Draws a green line from (100, 75) to (330, 22).
; PLAN: r0=100(x1), r1=75(y1), r2=330(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 75
LDI r2, 330
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
