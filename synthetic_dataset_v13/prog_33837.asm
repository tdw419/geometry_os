; DESCRIPTION: Draws a yellow line from (65, 50) to (89, 151).
; PLAN: r0=65(x1), r1=50(y1), r2=89(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 50
LDI r2, 89
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
