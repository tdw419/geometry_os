; DESCRIPTION: Draws a purple line from (469, 146) to (430, 128).
; PLAN: r0=469(x1), r1=146(y1), r2=430(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 146
LDI r2, 430
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
