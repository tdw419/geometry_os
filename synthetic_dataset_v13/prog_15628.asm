; DESCRIPTION: Draws a yellow line from (99, 16) to (121, 132).
; PLAN: r0=99(x1), r1=16(y1), r2=121(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 16
LDI r2, 121
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
