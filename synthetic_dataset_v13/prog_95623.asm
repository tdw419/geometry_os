; DESCRIPTION: Draws a black rectangle at (243, 0) with width 103 and height 92.
; PLAN: r0=243(x), r1=0(y), r2=103(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 0
LDI r2, 103
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
