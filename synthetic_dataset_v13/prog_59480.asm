; DESCRIPTION: Draws a yellow line from (109, 136) to (64, 103).
; PLAN: r0=109(x1), r1=136(y1), r2=64(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 136
LDI r2, 64
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
