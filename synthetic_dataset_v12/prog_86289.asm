; DESCRIPTION: Draws a red rectangle at (128, 14) with width 76 and height 17.
; PLAN: r0=128(x), r1=14(y), r2=76(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 14
LDI r2, 76
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
