; DESCRIPTION: Places a white line segment connecting (41, 103) to (497, 113).
; PLAN: r0=41(x1), r1=103(y1), r2=497(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 103
LDI r2, 497
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
