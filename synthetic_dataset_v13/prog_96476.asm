; DESCRIPTION: Draws a red rectangle at (265, 48) with width 21 and height 62.
; PLAN: r0=265(x), r1=48(y), r2=21(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 48
LDI r2, 21
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
