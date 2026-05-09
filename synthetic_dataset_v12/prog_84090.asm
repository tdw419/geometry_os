; DESCRIPTION: Draws a black rectangle at (354, 104) with width 68 and height 109.
; PLAN: r0=354(x), r1=104(y), r2=68(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 104
LDI r2, 68
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
