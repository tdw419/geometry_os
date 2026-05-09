; DESCRIPTION: Renders a cyan box of size 43x119 starting at (441, 78).
; PLAN: r0=441(x), r1=78(y), r2=43(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 78
LDI r2, 43
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
