; DESCRIPTION: Places a cyan 89x13 rectangle at position (377, 191).
; PLAN: r0=377(x), r1=191(y), r2=89(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 191
LDI r2, 89
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
