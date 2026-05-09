; DESCRIPTION: Renders a white box of size 67x116 starting at (201, 122).
; PLAN: r0=201(x), r1=122(y), r2=67(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 122
LDI r2, 67
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
