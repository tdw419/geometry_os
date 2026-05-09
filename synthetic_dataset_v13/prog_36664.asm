; DESCRIPTION: Draws a orange rectangle at (16, 24) with width 67 and height 47.
; PLAN: r0=16(x), r1=24(y), r2=67(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 24
LDI r2, 67
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
