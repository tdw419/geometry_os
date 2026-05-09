; DESCRIPTION: Draws a black rectangle at (335, 166) with width 109 and height 12.
; PLAN: r0=335(x), r1=166(y), r2=109(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 166
LDI r2, 109
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
