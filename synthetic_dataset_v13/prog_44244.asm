; DESCRIPTION: Draws a white line from (452, 142) to (56, 144).
; PLAN: r0=452(x1), r1=142(y1), r2=56(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 142
LDI r2, 56
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
