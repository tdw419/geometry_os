; DESCRIPTION: Renders a black box of size 77x29 starting at (5, 19).
; PLAN: r0=5(x), r1=19(y), r2=77(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 19
LDI r2, 77
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
