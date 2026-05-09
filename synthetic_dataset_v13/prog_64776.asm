; DESCRIPTION: Draws a red rectangle at (202, 172) with width 10 and height 43.
; PLAN: r0=202(x), r1=172(y), r2=10(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 172
LDI r2, 10
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
