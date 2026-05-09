; DESCRIPTION: Draws a yellow line from (66, 45) to (115, 100).
; PLAN: r0=66(x1), r1=45(y1), r2=115(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 45
LDI r2, 115
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
