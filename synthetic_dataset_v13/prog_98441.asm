; DESCRIPTION: Places a cyan 12x89 rectangle at position (66, 123).
; PLAN: r0=66(x), r1=123(y), r2=12(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 123
LDI r2, 12
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
