; DESCRIPTION: Renders a white box of size 108x49 starting at (342, 67).
; PLAN: r0=342(x), r1=67(y), r2=108(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 67
LDI r2, 108
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
