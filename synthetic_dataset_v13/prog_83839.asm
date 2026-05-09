; DESCRIPTION: Renders a black box of size 28x81 starting at (358, 63).
; PLAN: r0=358(x), r1=63(y), r2=28(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 63
LDI r2, 28
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
