; DESCRIPTION: Draws a black rectangle at (358, 67) with width 63 and height 80.
; PLAN: r0=358(x), r1=67(y), r2=63(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 67
LDI r2, 63
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
