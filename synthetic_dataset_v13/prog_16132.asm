; DESCRIPTION: Draws a green rectangle at (249, 28) with width 116 and height 72.
; PLAN: r0=249(x), r1=28(y), r2=116(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 28
LDI r2, 116
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
