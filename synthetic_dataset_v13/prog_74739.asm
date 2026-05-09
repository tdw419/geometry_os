; DESCRIPTION: Draws a red line from (385, 130) to (469, 245).
; PLAN: r0=385(x1), r1=130(y1), r2=469(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 130
LDI r2, 469
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
