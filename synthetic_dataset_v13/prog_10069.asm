; DESCRIPTION: Renders a cyan box of size 89x118 starting at (184, 20).
; PLAN: r0=184(x), r1=20(y), r2=89(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 20
LDI r2, 89
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
