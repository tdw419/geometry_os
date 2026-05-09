; DESCRIPTION: Places a white line segment connecting (204, 91) to (131, 113).
; PLAN: r0=204(x1), r1=91(y1), r2=131(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 91
LDI r2, 131
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
