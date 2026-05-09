; DESCRIPTION: Draws a white line from (192, 241) to (497, 84).
; PLAN: r0=192(x1), r1=241(y1), r2=497(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 241
LDI r2, 497
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
