; DESCRIPTION: Draws a blue line from (437, 44) to (241, 3).
; PLAN: r0=437(x1), r1=44(y1), r2=241(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 44
LDI r2, 241
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
