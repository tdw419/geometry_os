; DESCRIPTION: Draws a purple line from (39, 239) to (289, 49).
; PLAN: r0=39(x1), r1=239(y1), r2=289(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 239
LDI r2, 289
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
