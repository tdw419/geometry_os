; DESCRIPTION: Draws a white line from (120, 199) to (388, 87).
; PLAN: r0=120(x1), r1=199(y1), r2=388(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 199
LDI r2, 388
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
