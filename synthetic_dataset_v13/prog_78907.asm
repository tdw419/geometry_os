; DESCRIPTION: Renders a white box of size 11x30 starting at (454, 56).
; PLAN: r0=454(x), r1=56(y), r2=11(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 56
LDI r2, 11
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
