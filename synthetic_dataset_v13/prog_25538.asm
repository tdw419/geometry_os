; DESCRIPTION: Draws a black line from (307, 231) to (161, 181).
; PLAN: r0=307(x1), r1=231(y1), r2=161(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 231
LDI r2, 161
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
