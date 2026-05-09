; DESCRIPTION: Places a cyan 18x26 rectangle at position (314, 115).
; PLAN: r0=314(x), r1=115(y), r2=18(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 115
LDI r2, 18
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
