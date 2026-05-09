; DESCRIPTION: Draws a red rectangle at (469, 0) with width 26 and height 65.
; PLAN: r0=469(x), r1=0(y), r2=26(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 0
LDI r2, 26
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
