; DESCRIPTION: Renders a white box of size 82x78 starting at (291, 67).
; PLAN: r0=291(x), r1=67(y), r2=82(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 67
LDI r2, 82
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
