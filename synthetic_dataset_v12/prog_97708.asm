; DESCRIPTION: Draws a purple line from (182, 60) to (102, 209).
; PLAN: r0=182(x1), r1=60(y1), r2=102(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 60
LDI r2, 102
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
