; DESCRIPTION: Places a white 32x84 rectangle at position (421, 121).
; PLAN: r0=421(x), r1=121(y), r2=32(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 121
LDI r2, 32
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
