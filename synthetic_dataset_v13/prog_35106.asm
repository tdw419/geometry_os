; DESCRIPTION: Places a yellow 53x28 rectangle at position (267, 142).
; PLAN: r0=267(x), r1=142(y), r2=53(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 142
LDI r2, 53
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
