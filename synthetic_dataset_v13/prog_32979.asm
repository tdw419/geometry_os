; DESCRIPTION: Draws a red rectangle at (17, 46) with width 116 and height 90.
; PLAN: r0=17(x), r1=46(y), r2=116(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 46
LDI r2, 116
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
