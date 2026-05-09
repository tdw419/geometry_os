; DESCRIPTION: Renders a black box of size 11x113 starting at (490, 89).
; PLAN: r0=490(x), r1=89(y), r2=11(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 89
LDI r2, 11
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
