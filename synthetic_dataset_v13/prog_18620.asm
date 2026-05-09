; DESCRIPTION: Draws a blue line from (468, 206) to (248, 33).
; PLAN: r0=468(x1), r1=206(y1), r2=248(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 206
LDI r2, 248
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
