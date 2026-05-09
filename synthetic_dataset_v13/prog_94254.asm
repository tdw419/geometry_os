; DESCRIPTION: Draws a white line from (250, 57) to (177, 4).
; PLAN: r0=250(x1), r1=57(y1), r2=177(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 57
LDI r2, 177
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
