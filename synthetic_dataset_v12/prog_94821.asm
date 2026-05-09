; DESCRIPTION: Places a cyan 85x118 rectangle at position (190, 83).
; PLAN: r0=190(x), r1=83(y), r2=85(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 83
LDI r2, 85
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
