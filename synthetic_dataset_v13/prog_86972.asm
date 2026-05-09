; DESCRIPTION: Places a cyan 14x96 rectangle at position (74, 6).
; PLAN: r0=74(x), r1=6(y), r2=14(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 6
LDI r2, 14
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
