; DESCRIPTION: Draws a white line from (252, 107) to (116, 155).
; PLAN: r0=252(x1), r1=107(y1), r2=116(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 107
LDI r2, 116
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
