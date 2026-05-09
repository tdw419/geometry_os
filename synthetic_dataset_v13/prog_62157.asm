; DESCRIPTION: Draws a green line from (196, 121) to (246, 116).
; PLAN: r0=196(x1), r1=121(y1), r2=246(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 121
LDI r2, 246
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
