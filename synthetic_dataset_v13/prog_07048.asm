; DESCRIPTION: Draws a purple line from (384, 250) to (458, 108).
; PLAN: r0=384(x1), r1=250(y1), r2=458(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 250
LDI r2, 458
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
