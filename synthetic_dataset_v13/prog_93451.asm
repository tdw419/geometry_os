; DESCRIPTION: Draws a red rectangle at (100, 132) with width 63 and height 103.
; PLAN: r0=100(x), r1=132(y), r2=63(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 132
LDI r2, 63
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
