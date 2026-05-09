; DESCRIPTION: Draws a red rectangle at (62, 3) with width 23 and height 117.
; PLAN: r0=62(x), r1=3(y), r2=23(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 3
LDI r2, 23
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
