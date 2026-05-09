; DESCRIPTION: Draws a yellow line from (246, 72) to (96, 237).
; PLAN: r0=246(x1), r1=72(y1), r2=96(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 72
LDI r2, 96
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
