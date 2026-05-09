; DESCRIPTION: Draws a purple line from (446, 34) to (418, 40).
; PLAN: r0=446(x1), r1=34(y1), r2=418(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 34
LDI r2, 418
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
