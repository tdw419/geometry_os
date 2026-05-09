; DESCRIPTION: Places a magenta 87x102 rectangle at position (241, 26).
; PLAN: r0=241(x), r1=26(y), r2=87(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 26
LDI r2, 87
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
