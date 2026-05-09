; DESCRIPTION: Draws a white line from (152, 0) to (407, 7).
; PLAN: r0=152(x1), r1=0(y1), r2=407(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 0
LDI r2, 407
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
