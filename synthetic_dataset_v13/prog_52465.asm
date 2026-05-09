; DESCRIPTION: Draws a blue line from (383, 162) to (259, 87).
; PLAN: r0=383(x1), r1=162(y1), r2=259(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 162
LDI r2, 259
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
