; DESCRIPTION: Renders a cyan box of size 66x119 starting at (8, 118).
; PLAN: r0=8(x), r1=118(y), r2=66(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 118
LDI r2, 66
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
