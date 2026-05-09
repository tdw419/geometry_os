; DESCRIPTION: Draws a blue line from (40, 207) to (437, 9).
; PLAN: r0=40(x1), r1=207(y1), r2=437(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 207
LDI r2, 437
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
