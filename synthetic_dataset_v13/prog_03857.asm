; DESCRIPTION: Places a magenta 55x101 rectangle at position (98, 97).
; PLAN: r0=98(x), r1=97(y), r2=55(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 97
LDI r2, 55
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
