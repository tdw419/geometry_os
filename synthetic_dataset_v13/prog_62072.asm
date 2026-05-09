; DESCRIPTION: Draws a purple line from (493, 31) to (207, 18).
; PLAN: r0=493(x1), r1=31(y1), r2=207(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 31
LDI r2, 207
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
