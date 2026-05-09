; DESCRIPTION: Places a black 38x63 rectangle at position (396, 62).
; PLAN: r0=396(x), r1=62(y), r2=38(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 62
LDI r2, 38
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
