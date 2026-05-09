; DESCRIPTION: Draws a black rectangle at (243, 2) with width 66 and height 103.
; PLAN: r0=243(x), r1=2(y), r2=66(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 2
LDI r2, 66
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
