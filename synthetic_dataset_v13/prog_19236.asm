; DESCRIPTION: Places a magenta 49x49 rectangle at position (309, 8).
; PLAN: r0=309(x), r1=8(y), r2=49(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 8
LDI r2, 49
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
