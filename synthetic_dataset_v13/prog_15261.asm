; DESCRIPTION: Renders a white box of size 26x72 starting at (361, 184).
; PLAN: r0=361(x), r1=184(y), r2=26(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 184
LDI r2, 26
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
