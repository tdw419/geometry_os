; DESCRIPTION: Places a cyan 88x12 rectangle at position (36, 179).
; PLAN: r0=36(x), r1=179(y), r2=88(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 179
LDI r2, 88
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
