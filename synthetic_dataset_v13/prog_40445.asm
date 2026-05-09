; DESCRIPTION: Draws a black rectangle at (358, 80) with width 70 and height 64.
; PLAN: r0=358(x), r1=80(y), r2=70(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 80
LDI r2, 70
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
