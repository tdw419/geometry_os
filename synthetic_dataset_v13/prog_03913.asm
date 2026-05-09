; DESCRIPTION: Places a green 101x47 rectangle at position (267, 64).
; PLAN: r0=267(x), r1=64(y), r2=101(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 64
LDI r2, 101
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
