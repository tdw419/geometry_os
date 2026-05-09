; DESCRIPTION: Draws a green rectangle at (117, 67) with width 93 and height 111.
; PLAN: r0=117(x), r1=67(y), r2=93(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 67
LDI r2, 93
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
