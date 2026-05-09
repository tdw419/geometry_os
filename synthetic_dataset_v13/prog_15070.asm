; DESCRIPTION: Draws a blue line from (282, 73) to (411, 236).
; PLAN: r0=282(x1), r1=73(y1), r2=411(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 73
LDI r2, 411
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
