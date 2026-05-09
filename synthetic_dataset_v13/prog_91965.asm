; DESCRIPTION: Draws a red line from (318, 56) to (382, 13).
; PLAN: r0=318(x1), r1=56(y1), r2=382(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 56
LDI r2, 382
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
