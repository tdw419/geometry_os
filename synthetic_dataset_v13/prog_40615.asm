; DESCRIPTION: Draws a red rectangle at (54, 151) with width 36 and height 100.
; PLAN: r0=54(x), r1=151(y), r2=36(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 151
LDI r2, 36
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
