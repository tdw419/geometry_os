; DESCRIPTION: Draws a magenta rectangle at (258, 152) with width 71 and height 104.
; PLAN: r0=258(x), r1=152(y), r2=71(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 152
LDI r2, 71
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
