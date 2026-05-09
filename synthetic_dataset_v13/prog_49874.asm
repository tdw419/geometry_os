; DESCRIPTION: Renders a black box of size 11x10 starting at (140, 219).
; PLAN: r0=140(x), r1=219(y), r2=11(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 219
LDI r2, 11
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
