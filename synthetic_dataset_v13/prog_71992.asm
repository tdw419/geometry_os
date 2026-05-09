; DESCRIPTION: Draws a magenta rectangle at (272, 32) with width 117 and height 120.
; PLAN: r0=272(x), r1=32(y), r2=117(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 32
LDI r2, 117
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
