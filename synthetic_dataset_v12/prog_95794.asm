; DESCRIPTION: Draws a green line from (406, 18) to (188, 101).
; PLAN: r0=406(x1), r1=18(y1), r2=188(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 18
LDI r2, 188
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
