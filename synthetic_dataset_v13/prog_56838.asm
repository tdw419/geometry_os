; DESCRIPTION: Draws a blue line from (61, 212) to (164, 143).
; PLAN: r0=61(x1), r1=212(y1), r2=164(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 212
LDI r2, 164
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
