; DESCRIPTION: Places a red 32x63 rectangle at position (339, 76).
; PLAN: r0=339(x), r1=76(y), r2=32(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 76
LDI r2, 32
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
