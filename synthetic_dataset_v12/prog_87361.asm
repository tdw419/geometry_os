; DESCRIPTION: Draws a orange rectangle at (469, 39) with width 24 and height 91.
; PLAN: r0=469(x), r1=39(y), r2=24(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 39
LDI r2, 24
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
