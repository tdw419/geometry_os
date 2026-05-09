; DESCRIPTION: Draws a orange rectangle at (442, 153) with width 67 and height 92.
; PLAN: r0=442(x), r1=153(y), r2=67(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 153
LDI r2, 67
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
