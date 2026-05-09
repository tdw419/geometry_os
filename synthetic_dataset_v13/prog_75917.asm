; DESCRIPTION: Renders a cyan box of size 115x114 starting at (81, 98).
; PLAN: r0=81(x), r1=98(y), r2=115(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 98
LDI r2, 115
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
