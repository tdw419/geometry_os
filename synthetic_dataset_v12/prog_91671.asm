; DESCRIPTION: Draws a red rectangle at (170, 178) with width 59 and height 42.
; PLAN: r0=170(x), r1=178(y), r2=59(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 178
LDI r2, 59
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
