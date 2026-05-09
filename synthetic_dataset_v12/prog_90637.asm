; DESCRIPTION: Draws a red rectangle at (421, 9) with width 27 and height 12.
; PLAN: r0=421(x), r1=9(y), r2=27(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 9
LDI r2, 27
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
