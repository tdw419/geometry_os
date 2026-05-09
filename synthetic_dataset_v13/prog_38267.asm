; DESCRIPTION: Draws a magenta rectangle at (300, 87) with width 103 and height 41.
; PLAN: r0=300(x), r1=87(y), r2=103(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 87
LDI r2, 103
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
