; DESCRIPTION: Places a black 113x118 rectangle at position (190, 6).
; PLAN: r0=190(x), r1=6(y), r2=113(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 6
LDI r2, 113
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
