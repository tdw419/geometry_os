; DESCRIPTION: Draws a blue line from (221, 42) to (212, 151).
; PLAN: r0=221(x1), r1=42(y1), r2=212(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 42
LDI r2, 212
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
