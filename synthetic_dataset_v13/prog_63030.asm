; DESCRIPTION: Renders a cyan box of size 119x110 starting at (134, 106).
; PLAN: r0=134(x), r1=106(y), r2=119(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 106
LDI r2, 119
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
