; DESCRIPTION: Renders a cyan box of size 89x100 starting at (227, 114).
; PLAN: r0=227(x), r1=114(y), r2=89(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 114
LDI r2, 89
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
