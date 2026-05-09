; DESCRIPTION: Places a white 83x58 rectangle at position (375, 73).
; PLAN: r0=375(x), r1=73(y), r2=83(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 73
LDI r2, 83
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
