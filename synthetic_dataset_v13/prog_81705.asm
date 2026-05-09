; DESCRIPTION: Renders a white box of size 49x75 starting at (263, 67).
; PLAN: r0=263(x), r1=67(y), r2=49(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 67
LDI r2, 49
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
