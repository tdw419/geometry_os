; DESCRIPTION: Draws a magenta rectangle at (352, 48) with width 56 and height 16.
; PLAN: r0=352(x), r1=48(y), r2=56(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 48
LDI r2, 56
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
