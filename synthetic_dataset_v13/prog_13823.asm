; DESCRIPTION: Places a yellow 42x58 rectangle at position (376, 149).
; PLAN: r0=376(x), r1=149(y), r2=42(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 149
LDI r2, 42
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
