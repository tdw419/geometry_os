; DESCRIPTION: Draws a white line from (162, 253) to (489, 191).
; PLAN: r0=162(x1), r1=253(y1), r2=489(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 253
LDI r2, 489
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
