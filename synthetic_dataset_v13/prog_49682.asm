; DESCRIPTION: Places a cyan 25x96 rectangle at position (72, 126).
; PLAN: r0=72(x), r1=126(y), r2=25(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 126
LDI r2, 25
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
