; DESCRIPTION: Draws a green line from (101, 33) to (43, 205).
; PLAN: r0=101(x1), r1=33(y1), r2=43(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 33
LDI r2, 43
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
