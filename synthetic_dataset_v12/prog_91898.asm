; DESCRIPTION: Renders a white box of size 67x117 starting at (312, 14).
; PLAN: r0=312(x), r1=14(y), r2=67(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 14
LDI r2, 67
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
