; DESCRIPTION: Places a cyan 21x114 rectangle at position (179, 123).
; PLAN: r0=179(x), r1=123(y), r2=21(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 123
LDI r2, 21
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
