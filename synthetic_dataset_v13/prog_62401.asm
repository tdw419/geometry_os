; DESCRIPTION: Places a white 32x15 rectangle at position (210, 2).
; PLAN: r0=210(x), r1=2(y), r2=32(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 2
LDI r2, 32
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
