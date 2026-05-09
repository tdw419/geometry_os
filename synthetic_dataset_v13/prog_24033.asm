; DESCRIPTION: Draws a yellow line from (382, 64) to (484, 141).
; PLAN: r0=382(x1), r1=64(y1), r2=484(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 64
LDI r2, 484
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
