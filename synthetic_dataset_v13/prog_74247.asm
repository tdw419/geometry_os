; DESCRIPTION: Renders a black box of size 13x74 starting at (497, 87).
; PLAN: r0=497(x), r1=87(y), r2=13(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 87
LDI r2, 13
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
