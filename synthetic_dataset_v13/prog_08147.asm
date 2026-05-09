; DESCRIPTION: Draws a blue line from (131, 208) to (433, 46).
; PLAN: r0=131(x1), r1=208(y1), r2=433(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 208
LDI r2, 433
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
