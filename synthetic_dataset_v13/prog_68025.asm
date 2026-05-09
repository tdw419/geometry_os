; DESCRIPTION: Draws a yellow line from (165, 64) to (403, 208).
; PLAN: r0=165(x1), r1=64(y1), r2=403(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 64
LDI r2, 403
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
