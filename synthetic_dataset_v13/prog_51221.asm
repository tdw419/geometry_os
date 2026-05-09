; DESCRIPTION: Draws a red rectangle at (108, 15) with width 37 and height 64.
; PLAN: r0=108(x), r1=15(y), r2=37(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 15
LDI r2, 37
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
