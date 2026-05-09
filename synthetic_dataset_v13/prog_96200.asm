; DESCRIPTION: Places a magenta 79x82 rectangle at position (354, 48).
; PLAN: r0=354(x), r1=48(y), r2=79(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 48
LDI r2, 79
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
