; DESCRIPTION: Draws a magenta rectangle at (275, 186) with width 35 and height 67.
; PLAN: r0=275(x), r1=186(y), r2=35(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 186
LDI r2, 35
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
