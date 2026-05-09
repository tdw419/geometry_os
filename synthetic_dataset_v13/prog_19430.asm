; DESCRIPTION: Draws a orange rectangle at (207, 28) with width 39 and height 72.
; PLAN: r0=207(x), r1=28(y), r2=39(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 28
LDI r2, 39
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
