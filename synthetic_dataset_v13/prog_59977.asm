; DESCRIPTION: Draws a red rectangle at (59, 15) with width 22 and height 120.
; PLAN: r0=59(x), r1=15(y), r2=22(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 15
LDI r2, 22
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
