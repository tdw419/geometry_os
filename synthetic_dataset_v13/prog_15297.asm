; DESCRIPTION: Renders a cyan box of size 106x119 starting at (333, 122).
; PLAN: r0=333(x), r1=122(y), r2=106(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 122
LDI r2, 106
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
