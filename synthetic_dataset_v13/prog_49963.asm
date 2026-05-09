; DESCRIPTION: Draws a orange rectangle at (176, 107) with width 14 and height 113.
; PLAN: r0=176(x), r1=107(y), r2=14(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 107
LDI r2, 14
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
