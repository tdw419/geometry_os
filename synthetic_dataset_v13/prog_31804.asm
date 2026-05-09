; DESCRIPTION: Places a magenta 57x105 rectangle at position (319, 53).
; PLAN: r0=319(x), r1=53(y), r2=57(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 53
LDI r2, 57
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
