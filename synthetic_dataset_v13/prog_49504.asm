; DESCRIPTION: Draws a magenta rectangle at (32, 94) with width 120 and height 82.
; PLAN: r0=32(x), r1=94(y), r2=120(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 94
LDI r2, 120
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
