; DESCRIPTION: Places a yellow 32x75 rectangle at position (267, 6).
; PLAN: r0=267(x), r1=6(y), r2=32(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 6
LDI r2, 32
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
