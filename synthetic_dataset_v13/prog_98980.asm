; DESCRIPTION: Draws a orange rectangle at (374, 64) with width 82 and height 67.
; PLAN: r0=374(x), r1=64(y), r2=82(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 64
LDI r2, 82
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
