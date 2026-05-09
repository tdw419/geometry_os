; DESCRIPTION: Draws a green rectangle at (248, 67) with width 116 and height 111.
; PLAN: r0=248(x), r1=67(y), r2=116(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 67
LDI r2, 116
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
