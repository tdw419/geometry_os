; DESCRIPTION: Renders a cyan box of size 107x89 starting at (170, 77).
; PLAN: r0=170(x), r1=77(y), r2=107(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 77
LDI r2, 107
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
