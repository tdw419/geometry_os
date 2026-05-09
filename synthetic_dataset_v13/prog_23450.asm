; DESCRIPTION: Renders a black box of size 77x31 starting at (70, 67).
; PLAN: r0=70(x), r1=67(y), r2=77(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 67
LDI r2, 77
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
