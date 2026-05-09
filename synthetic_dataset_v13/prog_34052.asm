; DESCRIPTION: Draws a white line from (341, 226) to (506, 137).
; PLAN: r0=341(x1), r1=226(y1), r2=506(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 226
LDI r2, 506
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
