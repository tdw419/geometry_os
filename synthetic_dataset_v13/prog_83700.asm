; DESCRIPTION: Draws a yellow line from (202, 115) to (73, 56).
; PLAN: r0=202(x1), r1=115(y1), r2=73(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 115
LDI r2, 73
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
