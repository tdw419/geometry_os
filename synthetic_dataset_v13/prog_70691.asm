; DESCRIPTION: Draws a blue line from (478, 64) to (146, 229).
; PLAN: r0=478(x1), r1=64(y1), r2=146(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 64
LDI r2, 146
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
