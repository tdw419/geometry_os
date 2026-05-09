; DESCRIPTION: Draws a yellow rectangle at (27, 78) with width 35 and height 48.
; PLAN: r0=27(x), r1=78(y), r2=35(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 78
LDI r2, 35
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
