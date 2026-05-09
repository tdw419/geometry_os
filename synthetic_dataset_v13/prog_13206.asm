; DESCRIPTION: Draws a orange rectangle at (356, 167) with width 68 and height 59.
; PLAN: r0=356(x), r1=167(y), r2=68(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 167
LDI r2, 68
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
