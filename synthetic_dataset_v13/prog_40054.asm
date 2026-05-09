; DESCRIPTION: Draws a yellow rectangle at (153, 67) with width 109 and height 93.
; PLAN: r0=153(x), r1=67(y), r2=109(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 67
LDI r2, 109
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
