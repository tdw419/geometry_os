; DESCRIPTION: Draws a white line from (485, 172) to (328, 17).
; PLAN: r0=485(x1), r1=172(y1), r2=328(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 172
LDI r2, 328
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
