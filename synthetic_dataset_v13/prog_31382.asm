; DESCRIPTION: Draws a magenta rectangle at (187, 115) with width 113 and height 14.
; PLAN: r0=187(x), r1=115(y), r2=113(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 115
LDI r2, 113
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
