; DESCRIPTION: Places a black 35x75 rectangle at position (108, 42).
; PLAN: r0=108(x), r1=42(y), r2=35(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 42
LDI r2, 35
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
