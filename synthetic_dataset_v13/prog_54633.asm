; DESCRIPTION: Places a cyan 66x98 rectangle at position (396, 145).
; PLAN: r0=396(x), r1=145(y), r2=66(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 145
LDI r2, 66
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
