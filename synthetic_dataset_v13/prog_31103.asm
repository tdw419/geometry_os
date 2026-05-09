; DESCRIPTION: Places a cyan 30x67 rectangle at position (276, 118).
; PLAN: r0=276(x), r1=118(y), r2=30(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 118
LDI r2, 30
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
