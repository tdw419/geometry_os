; DESCRIPTION: Draws a purple line from (469, 163) to (215, 163).
; PLAN: r0=469(x1), r1=163(y1), r2=215(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 163
LDI r2, 215
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
