; DESCRIPTION: Draws a purple line from (11, 208) to (151, 173).
; PLAN: r0=11(x1), r1=208(y1), r2=151(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 208
LDI r2, 151
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
