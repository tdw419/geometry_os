; DESCRIPTION: Places a cyan 101x66 rectangle at position (6, 4).
; PLAN: r0=6(x), r1=4(y), r2=101(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 4
LDI r2, 101
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
