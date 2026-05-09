; DESCRIPTION: Places a magenta 72x14 rectangle at position (36, 104).
; PLAN: r0=36(x), r1=104(y), r2=72(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 104
LDI r2, 72
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
