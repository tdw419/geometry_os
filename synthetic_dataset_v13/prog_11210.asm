; DESCRIPTION: Places a black 29x85 rectangle at position (168, 13).
; PLAN: r0=168(x), r1=13(y), r2=29(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 13
LDI r2, 29
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
