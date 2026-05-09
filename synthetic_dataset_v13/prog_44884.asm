; DESCRIPTION: Places a white 87x21 rectangle at position (419, 156).
; PLAN: r0=419(x), r1=156(y), r2=87(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 156
LDI r2, 87
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
