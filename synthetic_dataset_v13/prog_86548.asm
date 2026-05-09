; DESCRIPTION: Draws a blue line from (38, 164) to (39, 9).
; PLAN: r0=38(x1), r1=164(y1), r2=39(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 164
LDI r2, 39
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
