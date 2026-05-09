; DESCRIPTION: Draws a orange rectangle at (404, 107) with width 53 and height 67.
; PLAN: r0=404(x), r1=107(y), r2=53(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 107
LDI r2, 53
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
