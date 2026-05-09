; DESCRIPTION: Renders a cyan box of size 62x94 starting at (115, 101).
; PLAN: r0=115(x), r1=101(y), r2=62(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 101
LDI r2, 62
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
