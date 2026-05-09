; DESCRIPTION: Draws a yellow rectangle at (379, 125) with width 85 and height 103.
; PLAN: r0=379(x), r1=125(y), r2=85(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 125
LDI r2, 85
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
