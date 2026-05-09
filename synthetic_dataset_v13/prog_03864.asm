; DESCRIPTION: Draws a blue line from (395, 179) to (479, 157).
; PLAN: r0=395(x1), r1=179(y1), r2=479(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 179
LDI r2, 479
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
