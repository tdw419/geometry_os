; DESCRIPTION: Places a black 76x96 rectangle at position (144, 45).
; PLAN: r0=144(x), r1=45(y), r2=76(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 45
LDI r2, 76
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
