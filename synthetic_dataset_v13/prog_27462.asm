; DESCRIPTION: Renders a black box of size 70x87 starting at (338, 88).
; PLAN: r0=338(x), r1=88(y), r2=70(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 88
LDI r2, 70
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
