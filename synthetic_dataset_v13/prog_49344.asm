; DESCRIPTION: Places a white 80x105 rectangle at position (257, 23).
; PLAN: r0=257(x), r1=23(y), r2=80(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 23
LDI r2, 80
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
