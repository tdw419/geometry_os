; DESCRIPTION: Draws a magenta rectangle at (262, 115) with width 40 and height 75.
; PLAN: r0=262(x), r1=115(y), r2=40(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 115
LDI r2, 40
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
