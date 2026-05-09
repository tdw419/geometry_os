; DESCRIPTION: Draws a purple line from (321, 111) to (256, 60).
; PLAN: r0=321(x1), r1=111(y1), r2=256(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 111
LDI r2, 256
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
