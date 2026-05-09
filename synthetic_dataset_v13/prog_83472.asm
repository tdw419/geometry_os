; DESCRIPTION: Places a white line segment connecting (293, 228) to (344, 176).
; PLAN: r0=293(x1), r1=228(y1), r2=344(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 228
LDI r2, 344
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
