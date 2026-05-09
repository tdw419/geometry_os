; DESCRIPTION: Draws a white line from (31, 246) to (154, 17).
; PLAN: r0=31(x1), r1=246(y1), r2=154(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 246
LDI r2, 154
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
