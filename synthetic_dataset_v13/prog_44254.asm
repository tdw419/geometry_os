; DESCRIPTION: Renders a cyan box of size 28x119 starting at (395, 43).
; PLAN: r0=395(x), r1=43(y), r2=28(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 43
LDI r2, 28
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
