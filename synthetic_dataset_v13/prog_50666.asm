; DESCRIPTION: Draws a orange rectangle at (284, 69) with width 94 and height 69.
; PLAN: r0=284(x), r1=69(y), r2=94(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 69
LDI r2, 94
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
