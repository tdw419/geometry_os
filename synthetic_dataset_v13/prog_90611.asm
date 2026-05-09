; DESCRIPTION: Draws a red rectangle at (182, 86) with width 90 and height 76.
; PLAN: r0=182(x), r1=86(y), r2=90(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 86
LDI r2, 90
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
