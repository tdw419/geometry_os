; DESCRIPTION: Places a red 48x93 rectangle at position (139, 128).
; PLAN: r0=139(x), r1=128(y), r2=48(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 128
LDI r2, 48
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
