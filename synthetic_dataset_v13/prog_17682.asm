; DESCRIPTION: Places a cyan 12x118 rectangle at position (383, 137).
; PLAN: r0=383(x), r1=137(y), r2=12(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 137
LDI r2, 12
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
