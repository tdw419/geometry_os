; DESCRIPTION: Places a black 85x83 rectangle at position (299, 91).
; PLAN: r0=299(x), r1=91(y), r2=85(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 91
LDI r2, 85
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
