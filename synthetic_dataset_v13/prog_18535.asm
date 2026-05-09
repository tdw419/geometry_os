; DESCRIPTION: Places a magenta 89x107 rectangle at position (53, 104).
; PLAN: r0=53(x), r1=104(y), r2=89(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 104
LDI r2, 89
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
