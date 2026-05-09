; DESCRIPTION: Draws a yellow line from (113, 136) to (30, 38).
; PLAN: r0=113(x1), r1=136(y1), r2=30(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 136
LDI r2, 30
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
