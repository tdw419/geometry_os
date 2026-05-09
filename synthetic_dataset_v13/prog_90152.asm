; DESCRIPTION: Draws a purple line from (372, 19) to (412, 210).
; PLAN: r0=372(x1), r1=19(y1), r2=412(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 19
LDI r2, 412
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
