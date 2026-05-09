; DESCRIPTION: Draws a magenta rectangle at (215, 4) with width 29 and height 93.
; PLAN: r0=215(x), r1=4(y), r2=29(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 4
LDI r2, 29
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
