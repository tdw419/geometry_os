; DESCRIPTION: Draws a magenta rectangle at (400, 28) with width 16 and height 64.
; PLAN: r0=400(x), r1=28(y), r2=16(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 28
LDI r2, 16
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
