; DESCRIPTION: Draws a yellow line from (311, 210) to (509, 151).
; PLAN: r0=311(x1), r1=210(y1), r2=509(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 210
LDI r2, 509
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
