; DESCRIPTION: Places a magenta 49x65 rectangle at position (43, 35).
; PLAN: r0=43(x), r1=35(y), r2=49(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 35
LDI r2, 49
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
