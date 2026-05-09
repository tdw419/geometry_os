; DESCRIPTION: Draws a purple line from (386, 237) to (322, 5).
; PLAN: r0=386(x1), r1=237(y1), r2=322(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 237
LDI r2, 322
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
