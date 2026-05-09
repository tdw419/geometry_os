; DESCRIPTION: Draws a blue line from (248, 16) to (161, 20).
; PLAN: r0=248(x1), r1=16(y1), r2=161(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 16
LDI r2, 161
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
