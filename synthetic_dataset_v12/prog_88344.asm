; DESCRIPTION: Draws a magenta line from (259, 175) to (484, 143).
; PLAN: r0=259(x1), r1=175(y1), r2=484(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 175
LDI r2, 484
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
