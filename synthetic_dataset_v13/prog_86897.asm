; DESCRIPTION: Draws a black rectangle at (412, 18) with width 90 and height 65.
; PLAN: r0=412(x), r1=18(y), r2=90(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 18
LDI r2, 90
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
