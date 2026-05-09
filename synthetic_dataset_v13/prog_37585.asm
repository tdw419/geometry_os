; DESCRIPTION: Draws a blue line from (146, 119) to (214, 254).
; PLAN: r0=146(x1), r1=119(y1), r2=214(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 119
LDI r2, 214
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
