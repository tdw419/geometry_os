; DESCRIPTION: Places a white line segment connecting (415, 246) to (58, 26).
; PLAN: r0=415(x1), r1=246(y1), r2=58(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 246
LDI r2, 58
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
