; DESCRIPTION: Draws a red rectangle at (43, 23) with width 107 and height 104.
; PLAN: r0=43(x), r1=23(y), r2=107(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 23
LDI r2, 107
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
