; DESCRIPTION: Places a white line segment connecting (40, 113) to (71, 223).
; PLAN: r0=40(x1), r1=113(y1), r2=71(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 113
LDI r2, 71
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
