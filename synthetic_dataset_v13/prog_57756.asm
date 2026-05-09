; DESCRIPTION: Places a white 62x57 rectangle at position (356, 2).
; PLAN: r0=356(x), r1=2(y), r2=62(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 2
LDI r2, 62
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
