; DESCRIPTION: Places a cyan 23x58 rectangle at position (308, 89).
; PLAN: r0=308(x), r1=89(y), r2=23(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 89
LDI r2, 23
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
