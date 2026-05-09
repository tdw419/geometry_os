; DESCRIPTION: Places a white 70x112 rectangle at position (257, 67).
; PLAN: r0=257(x), r1=67(y), r2=70(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 67
LDI r2, 70
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
