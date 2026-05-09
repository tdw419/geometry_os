; DESCRIPTION: Draws a green rectangle at (376, 63) with width 70 and height 82.
; PLAN: r0=376(x), r1=63(y), r2=70(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 63
LDI r2, 70
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
