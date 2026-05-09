; DESCRIPTION: Draws a magenta rectangle at (382, 71) with width 73 and height 93.
; PLAN: r0=382(x), r1=71(y), r2=73(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 71
LDI r2, 73
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
