; DESCRIPTION: Renders a green box of size 115x102 starting at (156, 55).
; PLAN: r0=156(x), r1=55(y), r2=115(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 55
LDI r2, 115
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
