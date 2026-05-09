; DESCRIPTION: Draws a red rectangle at (184, 46) with width 57 and height 14.
; PLAN: r0=184(x), r1=46(y), r2=57(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 46
LDI r2, 57
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
