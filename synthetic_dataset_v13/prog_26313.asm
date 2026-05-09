; DESCRIPTION: Draws a red rectangle at (221, 123) with width 27 and height 75.
; PLAN: r0=221(x), r1=123(y), r2=27(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 123
LDI r2, 27
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
