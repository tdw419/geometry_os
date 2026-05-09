; DESCRIPTION: Places a white line segment connecting (415, 204) to (270, 78).
; PLAN: r0=415(x1), r1=204(y1), r2=270(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 204
LDI r2, 270
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
