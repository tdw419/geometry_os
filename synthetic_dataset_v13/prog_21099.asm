; DESCRIPTION: Draws a blue line from (409, 210) to (0, 131).
; PLAN: r0=409(x1), r1=210(y1), r2=0(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 210
LDI r2, 0
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
