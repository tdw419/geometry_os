; DESCRIPTION: Places a cyan 79x24 rectangle at position (126, 11).
; PLAN: r0=126(x), r1=11(y), r2=79(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 11
LDI r2, 79
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
