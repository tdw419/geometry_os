; DESCRIPTION: Places a cyan 112x15 rectangle at position (37, 183).
; PLAN: r0=37(x), r1=183(y), r2=112(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 183
LDI r2, 112
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
