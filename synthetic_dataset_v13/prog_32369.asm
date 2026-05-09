; DESCRIPTION: Places a cyan 64x15 rectangle at position (166, 118).
; PLAN: r0=166(x), r1=118(y), r2=64(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 118
LDI r2, 64
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
