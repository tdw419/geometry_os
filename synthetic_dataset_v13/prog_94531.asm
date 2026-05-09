; DESCRIPTION: Places a white line segment connecting (484, 2) to (373, 228).
; PLAN: r0=484(x1), r1=2(y1), r2=373(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 2
LDI r2, 373
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
