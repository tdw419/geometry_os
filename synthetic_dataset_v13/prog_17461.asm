; DESCRIPTION: Draws a blue line from (383, 168) to (401, 2).
; PLAN: r0=383(x1), r1=168(y1), r2=401(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 168
LDI r2, 401
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
