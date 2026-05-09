; DESCRIPTION: Renders a cyan box of size 75x105 starting at (89, 71).
; PLAN: r0=89(x), r1=71(y), r2=75(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 71
LDI r2, 75
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
