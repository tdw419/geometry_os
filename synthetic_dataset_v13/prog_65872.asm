; DESCRIPTION: Draws a yellow line from (406, 35) to (91, 72).
; PLAN: r0=406(x1), r1=35(y1), r2=91(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 35
LDI r2, 91
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
