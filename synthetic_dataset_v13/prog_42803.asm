; DESCRIPTION: Draws a blue line from (406, 53) to (0, 186).
; PLAN: r0=406(x1), r1=53(y1), r2=0(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 53
LDI r2, 0
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
