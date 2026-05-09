; DESCRIPTION: Draws a magenta rectangle at (263, 109) with width 32 and height 104.
; PLAN: r0=263(x), r1=109(y), r2=32(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 109
LDI r2, 32
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
