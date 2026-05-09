; DESCRIPTION: Draws a green line from (202, 5) to (484, 151).
; PLAN: r0=202(x1), r1=5(y1), r2=484(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 5
LDI r2, 484
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
