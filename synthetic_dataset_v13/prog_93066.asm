; DESCRIPTION: Draws a blue line from (31, 161) to (480, 168).
; PLAN: r0=31(x1), r1=161(y1), r2=480(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 161
LDI r2, 480
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
