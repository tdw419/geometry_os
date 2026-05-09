; DESCRIPTION: Draws a purple line from (111, 167) to (333, 165).
; PLAN: r0=111(x1), r1=167(y1), r2=333(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 167
LDI r2, 333
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
