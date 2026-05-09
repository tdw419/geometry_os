; DESCRIPTION: Draws a white line from (226, 169) to (346, 122).
; PLAN: r0=226(x1), r1=169(y1), r2=346(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 169
LDI r2, 346
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
