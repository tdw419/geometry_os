; DESCRIPTION: Draws a red rectangle at (20, 22) with width 27 and height 28.
; PLAN: r0=20(x), r1=22(y), r2=27(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 22
LDI r2, 27
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
