; DESCRIPTION: Draws a magenta rectangle at (308, 34) with width 14 and height 14.
; PLAN: r0=308(x), r1=34(y), r2=14(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 34
LDI r2, 14
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
