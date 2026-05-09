; DESCRIPTION: Draws a white line from (381, 13) to (357, 226).
; PLAN: r0=381(x1), r1=13(y1), r2=357(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 13
LDI r2, 357
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
