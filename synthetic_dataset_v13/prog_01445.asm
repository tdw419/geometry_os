; DESCRIPTION: Draws a black rectangle at (18, 190) with width 69 and height 27.
; PLAN: r0=18(x), r1=190(y), r2=69(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 190
LDI r2, 69
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
