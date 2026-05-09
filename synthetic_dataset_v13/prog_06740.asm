; DESCRIPTION: Places a black 101x85 rectangle at position (10, 21).
; PLAN: r0=10(x), r1=21(y), r2=101(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 21
LDI r2, 101
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
