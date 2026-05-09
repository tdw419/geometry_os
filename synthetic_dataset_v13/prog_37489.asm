; DESCRIPTION: Draws a red rectangle at (151, 162) with width 103 and height 63.
; PLAN: r0=151(x), r1=162(y), r2=103(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 162
LDI r2, 103
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
