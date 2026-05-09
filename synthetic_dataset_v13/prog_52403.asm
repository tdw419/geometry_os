; DESCRIPTION: Renders a white box of size 53x12 starting at (5, 5).
; PLAN: r0=5(x), r1=5(y), r2=53(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 5
LDI r2, 53
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
