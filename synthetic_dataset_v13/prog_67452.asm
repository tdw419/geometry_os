; DESCRIPTION: Places a white 105x42 rectangle at position (211, 128).
; PLAN: r0=211(x), r1=128(y), r2=105(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 128
LDI r2, 105
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
