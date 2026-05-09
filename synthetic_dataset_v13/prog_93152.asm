; DESCRIPTION: Draws a yellow line from (230, 142) to (236, 64).
; PLAN: r0=230(x1), r1=142(y1), r2=236(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 142
LDI r2, 236
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
