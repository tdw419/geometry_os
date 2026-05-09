; DESCRIPTION: Draws a red rectangle at (280, 52) with width 82 and height 102.
; PLAN: r0=280(x), r1=52(y), r2=82(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 52
LDI r2, 82
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
