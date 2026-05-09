; DESCRIPTION: Places a red 87x14 rectangle at position (32, 73).
; PLAN: r0=32(x), r1=73(y), r2=87(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 73
LDI r2, 87
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
