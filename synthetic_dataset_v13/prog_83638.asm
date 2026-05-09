; DESCRIPTION: Places a white line segment connecting (316, 155) to (207, 113).
; PLAN: r0=316(x1), r1=155(y1), r2=207(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 155
LDI r2, 207
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
