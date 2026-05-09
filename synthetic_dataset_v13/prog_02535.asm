; DESCRIPTION: Places a white line segment connecting (182, 40) to (385, 122).
; PLAN: r0=182(x1), r1=40(y1), r2=385(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 40
LDI r2, 385
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
