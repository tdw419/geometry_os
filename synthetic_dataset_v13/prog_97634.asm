; DESCRIPTION: Places a white 32x18 rectangle at position (356, 110).
; PLAN: r0=356(x), r1=110(y), r2=32(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 110
LDI r2, 32
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
