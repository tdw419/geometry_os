; DESCRIPTION: Places a magenta 115x11 rectangle at position (390, 83).
; PLAN: r0=390(x), r1=83(y), r2=115(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 83
LDI r2, 115
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
