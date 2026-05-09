; DESCRIPTION: Places a white line segment connecting (267, 203) to (40, 248).
; PLAN: r0=267(x1), r1=203(y1), r2=40(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 203
LDI r2, 40
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
