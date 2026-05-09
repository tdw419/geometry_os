; DESCRIPTION: Places a cyan 66x36 rectangle at position (49, 139).
; PLAN: r0=49(x), r1=139(y), r2=66(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 139
LDI r2, 66
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
