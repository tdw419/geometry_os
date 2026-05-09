; DESCRIPTION: Renders a white line between points (469, 217) and (407, 222).
; PLAN: r0=469(x1), r1=217(y1), r2=407(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 217
LDI r2, 407
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
