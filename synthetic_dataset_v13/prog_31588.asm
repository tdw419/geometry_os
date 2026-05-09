; DESCRIPTION: Draws a magenta rectangle at (14, 152) with width 45 and height 93.
; PLAN: r0=14(x), r1=152(y), r2=45(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 152
LDI r2, 45
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
