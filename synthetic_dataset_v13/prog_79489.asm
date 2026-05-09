; DESCRIPTION: Draws a yellow line from (386, 229) to (250, 151).
; PLAN: r0=386(x1), r1=229(y1), r2=250(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 229
LDI r2, 250
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
