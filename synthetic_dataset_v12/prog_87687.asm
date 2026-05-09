; DESCRIPTION: Draws a purple line from (412, 232) to (372, 228).
; PLAN: r0=412(x1), r1=232(y1), r2=372(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 232
LDI r2, 372
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
