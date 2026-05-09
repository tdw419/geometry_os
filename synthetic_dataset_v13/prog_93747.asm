; DESCRIPTION: Places a magenta 15x85 rectangle at position (325, 170).
; PLAN: r0=325(x), r1=170(y), r2=15(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 170
LDI r2, 15
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
