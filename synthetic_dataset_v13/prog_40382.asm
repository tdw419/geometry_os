; DESCRIPTION: Draws a white line from (373, 11) to (182, 163).
; PLAN: r0=373(x1), r1=11(y1), r2=182(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 11
LDI r2, 182
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
