; DESCRIPTION: Renders a white box of size 67x35 starting at (373, 196).
; PLAN: r0=373(x), r1=196(y), r2=67(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 196
LDI r2, 67
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
