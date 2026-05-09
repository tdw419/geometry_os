; DESCRIPTION: Draws a white line from (247, 97) to (329, 247).
; PLAN: r0=247(x1), r1=97(y1), r2=329(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 97
LDI r2, 329
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
