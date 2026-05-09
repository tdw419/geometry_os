; DESCRIPTION: Places a blue 79x100 rectangle at position (354, 90).
; PLAN: r0=354(x), r1=90(y), r2=79(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 90
LDI r2, 79
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
