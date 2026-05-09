; DESCRIPTION: Draws a yellow line from (54, 161) to (102, 64).
; PLAN: r0=54(x1), r1=161(y1), r2=102(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 161
LDI r2, 102
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
