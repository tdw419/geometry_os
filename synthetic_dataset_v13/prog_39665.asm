; DESCRIPTION: Draws a black rectangle at (190, 146) with width 70 and height 67.
; PLAN: r0=190(x), r1=146(y), r2=70(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 146
LDI r2, 70
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
