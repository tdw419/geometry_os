; DESCRIPTION: Renders a cyan box of size 93x100 starting at (155, 114).
; PLAN: r0=155(x), r1=114(y), r2=93(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 114
LDI r2, 93
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
