; DESCRIPTION: Draws a yellow line from (406, 194) to (55, 249).
; PLAN: r0=406(x1), r1=194(y1), r2=55(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 194
LDI r2, 55
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
