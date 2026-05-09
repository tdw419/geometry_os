; DESCRIPTION: Places a cyan 73x118 rectangle at position (113, 90).
; PLAN: r0=113(x), r1=90(y), r2=73(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 90
LDI r2, 73
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
