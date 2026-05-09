; DESCRIPTION: Draws a red rectangle at (309, 172) with width 68 and height 10.
; PLAN: r0=309(x), r1=172(y), r2=68(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 172
LDI r2, 68
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
