; DESCRIPTION: Places a magenta 35x48 rectangle at position (376, 43).
; PLAN: r0=376(x), r1=43(y), r2=35(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 43
LDI r2, 35
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
