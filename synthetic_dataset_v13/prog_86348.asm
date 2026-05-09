; DESCRIPTION: Draws a red line from (353, 21) to (325, 49).
; PLAN: r0=353(x1), r1=21(y1), r2=325(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 21
LDI r2, 325
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
