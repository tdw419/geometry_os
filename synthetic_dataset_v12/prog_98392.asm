; DESCRIPTION: Draws a red rectangle at (109, 59) with width 18 and height 115.
; PLAN: r0=109(x), r1=59(y), r2=18(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 59
LDI r2, 18
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
