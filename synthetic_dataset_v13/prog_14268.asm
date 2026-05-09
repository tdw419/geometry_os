; DESCRIPTION: Draws a yellow line from (392, 36) to (297, 151).
; PLAN: r0=392(x1), r1=36(y1), r2=297(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 36
LDI r2, 297
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
