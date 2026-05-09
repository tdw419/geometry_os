; DESCRIPTION: Draws a white line from (261, 88) to (469, 226).
; PLAN: r0=261(x1), r1=88(y1), r2=469(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 88
LDI r2, 469
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
