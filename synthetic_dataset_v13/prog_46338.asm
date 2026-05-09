; DESCRIPTION: Places a magenta 14x105 rectangle at position (427, 26).
; PLAN: r0=427(x), r1=26(y), r2=14(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 26
LDI r2, 14
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
