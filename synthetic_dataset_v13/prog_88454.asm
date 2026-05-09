; DESCRIPTION: Draws a magenta rectangle at (239, 82) with width 24 and height 79.
; PLAN: r0=239(x), r1=82(y), r2=24(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 82
LDI r2, 24
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
