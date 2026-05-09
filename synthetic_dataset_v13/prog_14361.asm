; DESCRIPTION: Draws a orange rectangle at (460, 29) with width 24 and height 25.
; PLAN: r0=460(x), r1=29(y), r2=24(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 29
LDI r2, 24
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
