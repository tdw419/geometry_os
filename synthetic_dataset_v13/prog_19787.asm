; DESCRIPTION: Places a cyan 13x31 rectangle at position (458, 45).
; PLAN: r0=458(x), r1=45(y), r2=13(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 45
LDI r2, 13
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
