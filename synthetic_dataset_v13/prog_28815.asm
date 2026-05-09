; DESCRIPTION: Draws a blue line from (236, 186) to (301, 189).
; PLAN: r0=236(x1), r1=186(y1), r2=301(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 186
LDI r2, 301
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
