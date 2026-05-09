; DESCRIPTION: Draws a blue rectangle at (40, 82) with width 63 and height 98.
; PLAN: r0=40(x), r1=82(y), r2=63(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 82
LDI r2, 63
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
