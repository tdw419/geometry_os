; DESCRIPTION: Places a white 58x108 rectangle at position (230, 42).
; PLAN: r0=230(x), r1=42(y), r2=58(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 42
LDI r2, 58
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
