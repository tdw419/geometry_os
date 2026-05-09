; DESCRIPTION: Draws a blue line from (401, 115) to (60, 78).
; PLAN: r0=401(x1), r1=115(y1), r2=60(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 115
LDI r2, 60
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
