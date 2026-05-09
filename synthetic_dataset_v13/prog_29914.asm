; DESCRIPTION: Draws a purple line from (455, 248) to (455, 234).
; PLAN: r0=455(x1), r1=248(y1), r2=455(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 248
LDI r2, 455
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
