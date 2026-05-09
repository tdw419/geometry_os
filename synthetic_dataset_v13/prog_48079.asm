; DESCRIPTION: Places a magenta 104x101 rectangle at position (12, 94).
; PLAN: r0=12(x), r1=94(y), r2=104(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 94
LDI r2, 104
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
