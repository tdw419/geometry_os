; DESCRIPTION: Places a green 45x84 rectangle at position (32, 42).
; PLAN: r0=32(x), r1=42(y), r2=45(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 42
LDI r2, 45
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
