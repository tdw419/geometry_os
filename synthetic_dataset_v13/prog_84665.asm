; DESCRIPTION: Draws a purple line from (368, 209) to (468, 209).
; PLAN: r0=368(x1), r1=209(y1), r2=468(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 209
LDI r2, 468
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
