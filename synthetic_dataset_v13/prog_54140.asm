; DESCRIPTION: Places a blue 13x18 rectangle at position (354, 183).
; PLAN: r0=354(x), r1=183(y), r2=13(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 183
LDI r2, 13
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
