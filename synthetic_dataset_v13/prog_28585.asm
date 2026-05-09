; DESCRIPTION: Places a magenta 53x20 rectangle at position (267, 74).
; PLAN: r0=267(x), r1=74(y), r2=53(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 74
LDI r2, 53
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
