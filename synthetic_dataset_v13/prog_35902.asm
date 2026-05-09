; DESCRIPTION: Renders a white box of size 31x87 starting at (363, 80).
; PLAN: r0=363(x), r1=80(y), r2=31(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 80
LDI r2, 31
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
