; DESCRIPTION: Draws a yellow rectangle at (105, 48) with width 18 and height 48.
; PLAN: r0=105(x), r1=48(y), r2=18(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 48
LDI r2, 18
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
