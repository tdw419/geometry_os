; DESCRIPTION: Draws a red rectangle at (408, 11) with width 60 and height 19.
; PLAN: r0=408(x), r1=11(y), r2=60(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 11
LDI r2, 60
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
