; DESCRIPTION: Places a white line segment connecting (354, 120) to (373, 126).
; PLAN: r0=354(x1), r1=120(y1), r2=373(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 120
LDI r2, 373
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
