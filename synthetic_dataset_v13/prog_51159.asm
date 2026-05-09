; DESCRIPTION: Draws a blue line from (467, 58) to (322, 231).
; PLAN: r0=467(x1), r1=58(y1), r2=322(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 58
LDI r2, 322
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
