; DESCRIPTION: Places a magenta 111x104 rectangle at position (252, 94).
; PLAN: r0=252(x), r1=94(y), r2=111(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 94
LDI r2, 111
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
