; DESCRIPTION: Renders a white box of size 50x89 starting at (256, 53).
; PLAN: r0=256(x), r1=53(y), r2=50(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 53
LDI r2, 50
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
