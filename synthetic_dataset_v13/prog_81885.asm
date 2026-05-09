; DESCRIPTION: Renders a white box of size 67x47 starting at (444, 3).
; PLAN: r0=444(x), r1=3(y), r2=67(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 3
LDI r2, 67
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
