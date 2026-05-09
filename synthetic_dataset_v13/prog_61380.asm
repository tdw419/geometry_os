; DESCRIPTION: Places a white line segment connecting (113, 143) to (358, 54).
; PLAN: r0=113(x1), r1=143(y1), r2=358(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 143
LDI r2, 358
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
