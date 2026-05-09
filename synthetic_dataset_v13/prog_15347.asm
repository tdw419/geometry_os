; DESCRIPTION: Draws a blue line from (263, 114) to (424, 204).
; PLAN: r0=263(x1), r1=114(y1), r2=424(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 114
LDI r2, 424
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
