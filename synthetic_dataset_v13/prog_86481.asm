; DESCRIPTION: Draws a yellow line from (249, 162) to (321, 13).
; PLAN: r0=249(x1), r1=162(y1), r2=321(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 162
LDI r2, 321
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
