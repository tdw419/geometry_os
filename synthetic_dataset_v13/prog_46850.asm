; DESCRIPTION: Draws a red line from (321, 203) to (266, 57).
; PLAN: r0=321(x1), r1=203(y1), r2=266(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 203
LDI r2, 266
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
