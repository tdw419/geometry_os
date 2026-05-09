; DESCRIPTION: Places a cyan 61x39 rectangle at position (6, 179).
; PLAN: r0=6(x), r1=179(y), r2=61(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 179
LDI r2, 61
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
