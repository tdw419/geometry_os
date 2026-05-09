; DESCRIPTION: Draws a black rectangle at (269, 85) with width 111 and height 109.
; PLAN: r0=269(x), r1=85(y), r2=111(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 85
LDI r2, 111
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
