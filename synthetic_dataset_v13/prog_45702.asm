; DESCRIPTION: Draws a yellow line from (13, 119) to (96, 26).
; PLAN: r0=13(x1), r1=119(y1), r2=96(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 119
LDI r2, 96
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
