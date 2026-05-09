; DESCRIPTION: Draws a white line from (261, 107) to (407, 17).
; PLAN: r0=261(x1), r1=107(y1), r2=407(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 107
LDI r2, 407
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
