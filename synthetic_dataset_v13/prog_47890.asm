; DESCRIPTION: Renders a white box of size 20x38 starting at (134, 191).
; PLAN: r0=134(x), r1=191(y), r2=20(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 191
LDI r2, 20
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
