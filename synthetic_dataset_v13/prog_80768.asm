; DESCRIPTION: Draws a red rectangle at (153, 42) with width 108 and height 11.
; PLAN: r0=153(x), r1=42(y), r2=108(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 42
LDI r2, 108
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
