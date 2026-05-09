; DESCRIPTION: Places a cyan 32x24 rectangle at position (316, 122).
; PLAN: r0=316(x), r1=122(y), r2=32(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 122
LDI r2, 32
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
