; DESCRIPTION: Draws a red rectangle at (149, 172) with width 21 and height 17.
; PLAN: r0=149(x), r1=172(y), r2=21(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 172
LDI r2, 21
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
