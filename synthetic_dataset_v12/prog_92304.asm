; DESCRIPTION: Draws a purple line from (384, 178) to (487, 96).
; PLAN: r0=384(x1), r1=178(y1), r2=487(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 178
LDI r2, 487
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
