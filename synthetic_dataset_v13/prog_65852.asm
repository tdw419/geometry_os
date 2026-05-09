; DESCRIPTION: Places a cyan 29x40 rectangle at position (179, 23).
; PLAN: r0=179(x), r1=23(y), r2=29(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 23
LDI r2, 29
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
