; DESCRIPTION: Renders a white box of size 30x30 starting at (456, 73).
; PLAN: r0=456(x), r1=73(y), r2=30(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 73
LDI r2, 30
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
