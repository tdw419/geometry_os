; DESCRIPTION: Draws a magenta line from (151, 176) to (259, 238).
; PLAN: r0=151(x1), r1=176(y1), r2=259(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 176
LDI r2, 259
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
