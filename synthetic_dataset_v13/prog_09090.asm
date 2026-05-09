; DESCRIPTION: Places a white 93x33 rectangle at position (84, 62).
; PLAN: r0=84(x), r1=62(y), r2=93(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 62
LDI r2, 93
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
