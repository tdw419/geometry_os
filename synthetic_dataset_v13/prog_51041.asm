; DESCRIPTION: Places a blue 63x90 rectangle at position (354, 49).
; PLAN: r0=354(x), r1=49(y), r2=63(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 49
LDI r2, 63
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
