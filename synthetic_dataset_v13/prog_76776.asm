; DESCRIPTION: Places a white 62x23 rectangle at position (431, 98).
; PLAN: r0=431(x), r1=98(y), r2=62(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 98
LDI r2, 62
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
