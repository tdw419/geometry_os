; DESCRIPTION: Draws a magenta rectangle at (241, 58) with width 18 and height 82.
; PLAN: r0=241(x), r1=58(y), r2=18(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 58
LDI r2, 18
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
