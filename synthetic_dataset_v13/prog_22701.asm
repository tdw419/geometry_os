; DESCRIPTION: Places a cyan 118x14 rectangle at position (377, 37).
; PLAN: r0=377(x), r1=37(y), r2=118(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 37
LDI r2, 118
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
