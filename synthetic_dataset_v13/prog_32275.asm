; DESCRIPTION: Draws a blue line from (255, 18) to (234, 151).
; PLAN: r0=255(x1), r1=18(y1), r2=234(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 18
LDI r2, 234
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
