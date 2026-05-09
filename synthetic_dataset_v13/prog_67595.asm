; DESCRIPTION: Draws a blue line from (96, 14) to (383, 177).
; PLAN: r0=96(x1), r1=14(y1), r2=383(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 14
LDI r2, 383
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
