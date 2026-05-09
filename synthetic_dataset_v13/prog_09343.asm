; DESCRIPTION: Places a cyan 100x32 rectangle at position (276, 201).
; PLAN: r0=276(x), r1=201(y), r2=100(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 201
LDI r2, 100
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
