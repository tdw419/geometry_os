; DESCRIPTION: Draws a red rectangle at (15, 32) with width 38 and height 20.
; PLAN: r0=15(x), r1=32(y), r2=38(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 32
LDI r2, 38
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
