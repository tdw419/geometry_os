; DESCRIPTION: Renders a white box of size 112x70 starting at (363, 22).
; PLAN: r0=363(x), r1=22(y), r2=112(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 22
LDI r2, 112
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
