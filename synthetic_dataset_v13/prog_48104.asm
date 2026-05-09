; DESCRIPTION: Places a red 86x103 rectangle at position (32, 101).
; PLAN: r0=32(x), r1=101(y), r2=86(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 101
LDI r2, 86
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
