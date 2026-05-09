; DESCRIPTION: Places a blue 78x101 rectangle at position (267, 18).
; PLAN: r0=267(x), r1=18(y), r2=78(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 18
LDI r2, 78
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
