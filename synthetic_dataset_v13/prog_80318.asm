; DESCRIPTION: Draws a green line from (407, 104) to (136, 152).
; PLAN: r0=407(x1), r1=104(y1), r2=136(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 104
LDI r2, 136
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
