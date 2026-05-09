; DESCRIPTION: Places a white 89x84 rectangle at position (382, 63).
; PLAN: r0=382(x), r1=63(y), r2=89(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 63
LDI r2, 89
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
