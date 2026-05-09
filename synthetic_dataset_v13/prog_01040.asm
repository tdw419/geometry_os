; DESCRIPTION: Draws a black rectangle at (120, 102) with width 27 and height 40.
; PLAN: r0=120(x), r1=102(y), r2=27(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 102
LDI r2, 27
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
