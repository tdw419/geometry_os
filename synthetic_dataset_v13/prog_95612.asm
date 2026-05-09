; DESCRIPTION: Draws a orange rectangle at (282, 79) with width 60 and height 103.
; PLAN: r0=282(x), r1=79(y), r2=60(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 79
LDI r2, 60
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
