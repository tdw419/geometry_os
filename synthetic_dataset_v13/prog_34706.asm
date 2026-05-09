; DESCRIPTION: Places a white 45x88 rectangle at position (281, 128).
; PLAN: r0=281(x), r1=128(y), r2=45(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 128
LDI r2, 45
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
