; DESCRIPTION: Draws a red rectangle at (128, 35) with width 23 and height 36.
; PLAN: r0=128(x), r1=35(y), r2=23(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 35
LDI r2, 23
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
