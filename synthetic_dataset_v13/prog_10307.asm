; DESCRIPTION: Draws a yellow line from (504, 19) to (55, 151).
; PLAN: r0=504(x1), r1=19(y1), r2=55(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 19
LDI r2, 55
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
