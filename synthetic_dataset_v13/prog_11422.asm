; DESCRIPTION: Places a black 32x120 rectangle at position (86, 120).
; PLAN: r0=86(x), r1=120(y), r2=32(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 120
LDI r2, 32
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
