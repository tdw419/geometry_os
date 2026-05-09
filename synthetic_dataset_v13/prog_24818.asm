; DESCRIPTION: Places a cyan 115x89 rectangle at position (44, 19).
; PLAN: r0=44(x), r1=19(y), r2=115(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 19
LDI r2, 115
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
