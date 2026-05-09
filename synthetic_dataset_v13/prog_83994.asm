; DESCRIPTION: Places a white 79x84 rectangle at position (354, 48).
; PLAN: r0=354(x), r1=48(y), r2=79(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 48
LDI r2, 79
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
