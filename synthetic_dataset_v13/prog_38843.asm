; DESCRIPTION: Renders a black box of size 81x109 starting at (18, 6).
; PLAN: r0=18(x), r1=6(y), r2=81(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 6
LDI r2, 81
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
