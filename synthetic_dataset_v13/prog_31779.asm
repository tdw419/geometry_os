; DESCRIPTION: Draws a red rectangle at (330, 107) with width 88 and height 84.
; PLAN: r0=330(x), r1=107(y), r2=88(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 107
LDI r2, 88
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
