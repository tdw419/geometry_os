; DESCRIPTION: Draws a purple line from (256, 70) to (466, 182).
; PLAN: r0=256(x1), r1=70(y1), r2=466(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 70
LDI r2, 466
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
