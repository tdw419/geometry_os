; DESCRIPTION: Draws a red rectangle at (20, 209) with width 100 and height 36.
; PLAN: r0=20(x), r1=209(y), r2=100(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 209
LDI r2, 100
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
