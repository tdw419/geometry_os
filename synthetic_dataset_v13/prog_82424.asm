; DESCRIPTION: Draws a purple line from (354, 21) to (399, 36).
; PLAN: r0=354(x1), r1=21(y1), r2=399(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 21
LDI r2, 399
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
