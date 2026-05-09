; DESCRIPTION: Places a cyan 100x93 rectangle at position (8, 134).
; PLAN: r0=8(x), r1=134(y), r2=100(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 134
LDI r2, 100
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
