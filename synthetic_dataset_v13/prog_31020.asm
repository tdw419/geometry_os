; DESCRIPTION: Renders a cyan box of size 18x93 starting at (192, 148).
; PLAN: r0=192(x), r1=148(y), r2=18(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 148
LDI r2, 18
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
