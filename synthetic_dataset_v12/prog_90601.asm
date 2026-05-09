; DESCRIPTION: Places a yellow 93x64 rectangle at position (343, 30).
; PLAN: r0=343(x), r1=30(y), r2=93(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 30
LDI r2, 93
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
