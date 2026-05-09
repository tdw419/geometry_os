; DESCRIPTION: Draws a orange rectangle at (337, 134) with width 103 and height 48.
; PLAN: r0=337(x), r1=134(y), r2=103(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 134
LDI r2, 103
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
