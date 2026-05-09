; DESCRIPTION: Draws a black rectangle at (103, 103) with width 109 and height 90.
; PLAN: r0=103(x), r1=103(y), r2=109(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 103
LDI r2, 109
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
