; DESCRIPTION: Draws a red rectangle at (254, 80) with width 99 and height 108.
; PLAN: r0=254(x), r1=80(y), r2=99(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 80
LDI r2, 99
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
