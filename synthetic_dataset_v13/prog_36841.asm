; DESCRIPTION: Places a magenta 98x12 rectangle at position (122, 31).
; PLAN: r0=122(x), r1=31(y), r2=98(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 31
LDI r2, 98
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
