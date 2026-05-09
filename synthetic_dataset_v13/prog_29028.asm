; DESCRIPTION: Places a cyan 30x28 rectangle at position (126, 15).
; PLAN: r0=126(x), r1=15(y), r2=30(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 15
LDI r2, 30
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
