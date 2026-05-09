; DESCRIPTION: Places a white 84x56 rectangle at position (299, 11).
; PLAN: r0=299(x), r1=11(y), r2=84(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 11
LDI r2, 84
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
