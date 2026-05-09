; DESCRIPTION: Places a magenta 98x17 rectangle at position (231, 49).
; PLAN: r0=231(x), r1=49(y), r2=98(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 49
LDI r2, 98
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
