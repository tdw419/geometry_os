; DESCRIPTION: Draws a purple line from (332, 226) to (210, 114).
; PLAN: r0=332(x1), r1=226(y1), r2=210(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 226
LDI r2, 210
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
