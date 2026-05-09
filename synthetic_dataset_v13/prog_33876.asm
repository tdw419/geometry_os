; DESCRIPTION: Renders a cyan box of size 115x26 starting at (318, 137).
; PLAN: r0=318(x), r1=137(y), r2=115(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 137
LDI r2, 115
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
