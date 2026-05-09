; DESCRIPTION: Places a magenta 44x88 rectangle at position (267, 137).
; PLAN: r0=267(x), r1=137(y), r2=44(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 137
LDI r2, 44
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
