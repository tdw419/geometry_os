; DESCRIPTION: Places a white line segment connecting (113, 83) to (276, 180).
; PLAN: r0=113(x1), r1=83(y1), r2=276(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 83
LDI r2, 276
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
