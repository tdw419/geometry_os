; DESCRIPTION: Draws a purple line from (209, 194) to (380, 219).
; PLAN: r0=209(x1), r1=194(y1), r2=380(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 194
LDI r2, 380
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
