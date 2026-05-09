; DESCRIPTION: Places a cyan 100x24 rectangle at position (396, 217).
; PLAN: r0=396(x), r1=217(y), r2=100(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 217
LDI r2, 100
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
