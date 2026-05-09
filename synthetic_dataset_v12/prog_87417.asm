; DESCRIPTION: Places a white line segment connecting (328, 72) to (332, 113).
; PLAN: r0=328(x1), r1=72(y1), r2=332(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 72
LDI r2, 332
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
