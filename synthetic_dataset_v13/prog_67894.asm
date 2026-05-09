; DESCRIPTION: Draws a red rectangle at (363, 165) with width 11 and height 59.
; PLAN: r0=363(x), r1=165(y), r2=11(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 165
LDI r2, 11
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
