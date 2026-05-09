; DESCRIPTION: Draws a red rectangle at (330, 43) with width 68 and height 95.
; PLAN: r0=330(x), r1=43(y), r2=68(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 43
LDI r2, 68
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
