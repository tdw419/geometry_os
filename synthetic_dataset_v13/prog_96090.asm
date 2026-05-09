; DESCRIPTION: Renders a black box of size 89x100 starting at (46, 2).
; PLAN: r0=46(x), r1=2(y), r2=89(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 2
LDI r2, 89
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
