; DESCRIPTION: Renders a black box of size 18x66 starting at (267, 8).
; PLAN: r0=267(x), r1=8(y), r2=18(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 8
LDI r2, 18
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
