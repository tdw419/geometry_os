; DESCRIPTION: Places a black 28x68 rectangle at position (139, 42).
; PLAN: r0=139(x), r1=42(y), r2=28(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 42
LDI r2, 28
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
