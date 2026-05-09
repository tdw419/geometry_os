; DESCRIPTION: Draws a red line from (325, 83) to (319, 57).
; PLAN: r0=325(x1), r1=83(y1), r2=319(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 83
LDI r2, 319
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
