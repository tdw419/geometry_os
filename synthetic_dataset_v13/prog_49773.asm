; DESCRIPTION: Places a red 86x49 rectangle at position (297, 64).
; PLAN: r0=297(x), r1=64(y), r2=86(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 64
LDI r2, 86
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
