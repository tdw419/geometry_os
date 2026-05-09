; DESCRIPTION: Places a cyan 89x78 rectangle at position (309, 92).
; PLAN: r0=309(x), r1=92(y), r2=89(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 92
LDI r2, 89
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
