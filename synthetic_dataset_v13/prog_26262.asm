; DESCRIPTION: Places a cyan 99x31 rectangle at position (139, 176).
; PLAN: r0=139(x), r1=176(y), r2=99(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 176
LDI r2, 99
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
