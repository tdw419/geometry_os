; DESCRIPTION: Draws a yellow line from (96, 30) to (345, 31).
; PLAN: r0=96(x1), r1=30(y1), r2=345(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 30
LDI r2, 345
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
