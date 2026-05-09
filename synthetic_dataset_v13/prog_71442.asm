; DESCRIPTION: Draws a yellow line from (64, 6) to (74, 137).
; PLAN: r0=64(x1), r1=6(y1), r2=74(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 6
LDI r2, 74
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
