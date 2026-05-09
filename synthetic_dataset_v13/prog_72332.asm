; DESCRIPTION: Places a black 76x115 rectangle at position (16, 2).
; PLAN: r0=16(x), r1=2(y), r2=76(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 2
LDI r2, 76
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
