; DESCRIPTION: Renders a cyan box of size 37x119 starting at (97, 23).
; PLAN: r0=97(x), r1=23(y), r2=37(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 23
LDI r2, 37
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
