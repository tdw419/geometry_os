; DESCRIPTION: Places a green 62x42 rectangle at position (234, 110).
; PLAN: r0=234(x), r1=110(y), r2=62(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 110
LDI r2, 62
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
