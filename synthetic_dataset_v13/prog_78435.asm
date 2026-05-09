; DESCRIPTION: Draws a blue line from (377, 13) to (406, 68).
; PLAN: r0=377(x1), r1=13(y1), r2=406(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 13
LDI r2, 406
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
