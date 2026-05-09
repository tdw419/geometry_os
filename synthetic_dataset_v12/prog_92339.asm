; DESCRIPTION: Places a white 110x108 rectangle at position (98, 100).
; PLAN: r0=98(x), r1=100(y), r2=110(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 100
LDI r2, 110
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
