; DESCRIPTION: Draws a blue line from (221, 39) to (327, 162).
; PLAN: r0=221(x1), r1=39(y1), r2=327(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 39
LDI r2, 327
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
