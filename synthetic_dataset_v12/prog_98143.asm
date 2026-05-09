; DESCRIPTION: Draws a white line from (222, 48) to (177, 155).
; PLAN: r0=222(x1), r1=48(y1), r2=177(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 48
LDI r2, 177
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
