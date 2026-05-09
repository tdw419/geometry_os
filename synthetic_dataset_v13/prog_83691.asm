; DESCRIPTION: Renders a black box of size 84x63 starting at (6, 103).
; PLAN: r0=6(x), r1=103(y), r2=84(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 103
LDI r2, 84
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
