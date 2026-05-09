; DESCRIPTION: Places a white line segment connecting (353, 211) to (376, 117).
; PLAN: r0=353(x1), r1=211(y1), r2=376(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 211
LDI r2, 376
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
