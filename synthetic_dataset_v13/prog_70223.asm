; DESCRIPTION: Renders a cyan box of size 64x119 starting at (37, 46).
; PLAN: r0=37(x), r1=46(y), r2=64(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 46
LDI r2, 64
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
