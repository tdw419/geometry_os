; DESCRIPTION: Draws a yellow line from (406, 131) to (22, 76).
; PLAN: r0=406(x1), r1=131(y1), r2=22(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 131
LDI r2, 22
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
