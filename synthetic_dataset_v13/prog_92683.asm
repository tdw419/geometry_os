; DESCRIPTION: Places a red 83x98 rectangle at position (379, 122).
; PLAN: r0=379(x), r1=122(y), r2=83(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 122
LDI r2, 83
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
