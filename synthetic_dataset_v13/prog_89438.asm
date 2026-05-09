; DESCRIPTION: Draws a orange rectangle at (215, 160) with width 22 and height 67.
; PLAN: r0=215(x), r1=160(y), r2=22(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 160
LDI r2, 22
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
