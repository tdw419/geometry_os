; DESCRIPTION: Renders a green box of size 13x64 starting at (84, 93).
; PLAN: r0=84(x), r1=93(y), r2=13(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 93
LDI r2, 13
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
