; DESCRIPTION: Renders a white box of size 30x81 starting at (150, 88).
; PLAN: r0=150(x), r1=88(y), r2=30(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 88
LDI r2, 30
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
