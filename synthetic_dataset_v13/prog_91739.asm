; DESCRIPTION: Places a white 110x108 rectangle at position (382, 62).
; PLAN: r0=382(x), r1=62(y), r2=110(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 62
LDI r2, 110
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
