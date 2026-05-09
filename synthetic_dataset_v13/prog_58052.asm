; DESCRIPTION: Draws a white line from (35, 130) to (316, 222).
; PLAN: r0=35(x1), r1=130(y1), r2=316(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 130
LDI r2, 316
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
