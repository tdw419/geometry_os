; DESCRIPTION: Draws a yellow line from (72, 64) to (417, 4).
; PLAN: r0=72(x1), r1=64(y1), r2=417(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 64
LDI r2, 417
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
