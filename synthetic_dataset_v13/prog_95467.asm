; DESCRIPTION: Draws a orange rectangle at (329, 167) with width 14 and height 16.
; PLAN: r0=329(x), r1=167(y), r2=14(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 167
LDI r2, 14
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
