; DESCRIPTION: Places a yellow 118x64 rectangle at position (334, 75).
; PLAN: r0=334(x), r1=75(y), r2=118(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 75
LDI r2, 118
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
