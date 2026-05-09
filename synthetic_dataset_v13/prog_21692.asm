; DESCRIPTION: Places a yellow 58x60 rectangle at position (42, 163).
; PLAN: r0=42(x), r1=163(y), r2=58(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 163
LDI r2, 58
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
