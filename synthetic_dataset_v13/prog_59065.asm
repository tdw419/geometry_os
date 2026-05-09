; DESCRIPTION: Draws a magenta rectangle at (333, 128) with width 72 and height 26.
; PLAN: r0=333(x), r1=128(y), r2=72(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 128
LDI r2, 72
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
