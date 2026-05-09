; DESCRIPTION: Places a white line segment connecting (415, 21) to (191, 70).
; PLAN: r0=415(x1), r1=21(y1), r2=191(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 21
LDI r2, 191
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
