; DESCRIPTION: Renders a white box of size 98x14 starting at (189, 67).
; PLAN: r0=189(x), r1=67(y), r2=98(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 67
LDI r2, 98
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
