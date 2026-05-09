; DESCRIPTION: Places a white line segment connecting (49, 112) to (296, 165).
; PLAN: r0=49(x1), r1=112(y1), r2=296(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 112
LDI r2, 296
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
