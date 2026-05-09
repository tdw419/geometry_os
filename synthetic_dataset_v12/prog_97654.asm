; DESCRIPTION: Places a black 43x37 rectangle at position (12, 139).
; PLAN: r0=12(x), r1=139(y), r2=43(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 139
LDI r2, 43
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
