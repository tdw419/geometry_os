; DESCRIPTION: Draws a red rectangle at (193, 122) with width 13 and height 102.
; PLAN: r0=193(x), r1=122(y), r2=13(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 122
LDI r2, 13
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
