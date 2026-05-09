; DESCRIPTION: Draws a green rectangle at (156, 79) with width 61 and height 67.
; PLAN: r0=156(x), r1=79(y), r2=61(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 79
LDI r2, 61
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
