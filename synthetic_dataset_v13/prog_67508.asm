; DESCRIPTION: Renders a black box of size 67x85 starting at (3, 44).
; PLAN: r0=3(x), r1=44(y), r2=67(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 44
LDI r2, 67
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
