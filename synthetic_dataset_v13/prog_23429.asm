; DESCRIPTION: Draws a black rectangle at (20, 34) with width 27 and height 103.
; PLAN: r0=20(x), r1=34(y), r2=27(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 34
LDI r2, 27
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
