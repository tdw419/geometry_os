; DESCRIPTION: Places a black 98x60 rectangle at position (76, 30).
; PLAN: r0=76(x), r1=30(y), r2=98(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 30
LDI r2, 98
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
