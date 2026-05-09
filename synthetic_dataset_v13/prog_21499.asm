; DESCRIPTION: Places a cyan 53x89 rectangle at position (3, 54).
; PLAN: r0=3(x), r1=54(y), r2=53(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 54
LDI r2, 53
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
