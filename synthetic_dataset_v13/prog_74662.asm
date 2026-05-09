; DESCRIPTION: Draws a purple line from (511, 111) to (444, 243).
; PLAN: r0=511(x1), r1=111(y1), r2=444(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 111
LDI r2, 444
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
