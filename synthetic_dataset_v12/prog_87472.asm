; DESCRIPTION: Draws a blue rectangle at (357, 71) with width 82 and height 93.
; PLAN: r0=357(x), r1=71(y), r2=82(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 71
LDI r2, 82
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
