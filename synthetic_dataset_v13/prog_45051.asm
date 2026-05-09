; DESCRIPTION: Draws a white line from (274, 175) to (444, 204).
; PLAN: r0=274(x1), r1=175(y1), r2=444(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 175
LDI r2, 444
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
