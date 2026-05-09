; DESCRIPTION: Places a cyan 66x58 rectangle at position (176, 141).
; PLAN: r0=176(x), r1=141(y), r2=66(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 141
LDI r2, 66
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
