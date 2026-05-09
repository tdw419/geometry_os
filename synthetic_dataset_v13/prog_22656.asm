; DESCRIPTION: Renders a green box of size 14x93 starting at (311, 64).
; PLAN: r0=311(x), r1=64(y), r2=14(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 64
LDI r2, 14
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
