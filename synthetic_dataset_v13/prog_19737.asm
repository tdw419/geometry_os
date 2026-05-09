; DESCRIPTION: Draws a white line from (229, 182) to (402, 97).
; PLAN: r0=229(x1), r1=182(y1), r2=402(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 182
LDI r2, 402
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
