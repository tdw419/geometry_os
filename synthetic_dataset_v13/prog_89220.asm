; DESCRIPTION: Draws a green line from (345, 181) to (144, 99).
; PLAN: r0=345(x1), r1=181(y1), r2=144(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 181
LDI r2, 144
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
