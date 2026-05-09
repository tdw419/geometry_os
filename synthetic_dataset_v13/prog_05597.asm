; DESCRIPTION: Draws a green rectangle at (322, 85) with width 12 and height 42.
; PLAN: r0=322(x), r1=85(y), r2=12(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 85
LDI r2, 12
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
