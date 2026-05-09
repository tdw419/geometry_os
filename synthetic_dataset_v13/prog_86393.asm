; DESCRIPTION: Draws a orange rectangle at (180, 8) with width 47 and height 67.
; PLAN: r0=180(x), r1=8(y), r2=47(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 8
LDI r2, 47
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
