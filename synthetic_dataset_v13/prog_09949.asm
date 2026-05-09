; DESCRIPTION: Places a black 63x75 rectangle at position (267, 20).
; PLAN: r0=267(x), r1=20(y), r2=63(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 20
LDI r2, 63
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
