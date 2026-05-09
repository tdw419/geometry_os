; DESCRIPTION: Places a white 29x75 rectangle at position (451, 100).
; PLAN: r0=451(x), r1=100(y), r2=29(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 100
LDI r2, 29
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
