; DESCRIPTION: Renders a white box of size 89x72 starting at (203, 36).
; PLAN: r0=203(x), r1=36(y), r2=89(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 36
LDI r2, 89
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
