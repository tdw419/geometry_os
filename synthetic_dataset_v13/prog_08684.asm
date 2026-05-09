; DESCRIPTION: Places a orange line segment connecting (239, 58) to (415, 37).
; PLAN: r0=239(x1), r1=58(y1), r2=415(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 58
LDI r2, 415
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
