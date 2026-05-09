; DESCRIPTION: Draws a red rectangle at (156, 117) with width 46 and height 116.
; PLAN: r0=156(x), r1=117(y), r2=46(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 117
LDI r2, 46
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
