; DESCRIPTION: Renders a white box of size 49x30 starting at (85, 117).
; PLAN: r0=85(x), r1=117(y), r2=49(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 117
LDI r2, 49
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
