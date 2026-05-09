; DESCRIPTION: Places a black 86x20 rectangle at position (16, 118).
; PLAN: r0=16(x), r1=118(y), r2=86(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 118
LDI r2, 86
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
