; DESCRIPTION: Places a white 115x14 rectangle at position (5, 128).
; PLAN: r0=5(x), r1=128(y), r2=115(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 128
LDI r2, 115
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
