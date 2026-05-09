; DESCRIPTION: Places a black 83x107 rectangle at position (20, 68).
; PLAN: r0=20(x), r1=68(y), r2=83(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 68
LDI r2, 83
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
