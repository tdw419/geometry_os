; DESCRIPTION: Places a black 32x66 rectangle at position (30, 13).
; PLAN: r0=30(x), r1=13(y), r2=32(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 13
LDI r2, 32
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
