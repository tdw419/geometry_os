; DESCRIPTION: Renders a green box of size 75x93 starting at (383, 153).
; PLAN: r0=383(x), r1=153(y), r2=75(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 153
LDI r2, 75
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
