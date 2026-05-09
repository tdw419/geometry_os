; DESCRIPTION: Draws a purple line from (307, 20) to (204, 27).
; PLAN: r0=307(x1), r1=20(y1), r2=204(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 20
LDI r2, 204
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
