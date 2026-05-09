; DESCRIPTION: Places a magenta 104x88 rectangle at position (359, 36).
; PLAN: r0=359(x), r1=36(y), r2=104(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 36
LDI r2, 104
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
