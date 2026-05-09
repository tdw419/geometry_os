; DESCRIPTION: Renders a white box of size 84x76 starting at (399, 124).
; PLAN: r0=399(x), r1=124(y), r2=84(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 124
LDI r2, 84
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
