; DESCRIPTION: Draws a magenta rectangle at (305, 64) with width 102 and height 14.
; PLAN: r0=305(x), r1=64(y), r2=102(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 64
LDI r2, 102
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
