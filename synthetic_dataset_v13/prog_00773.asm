; DESCRIPTION: Places a green 74x66 rectangle at position (190, 157).
; PLAN: r0=190(x), r1=157(y), r2=74(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 157
LDI r2, 74
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
