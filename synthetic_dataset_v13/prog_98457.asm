; DESCRIPTION: Places a blue 24x120 rectangle at position (354, 23).
; PLAN: r0=354(x), r1=23(y), r2=24(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 23
LDI r2, 24
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
