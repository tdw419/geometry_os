; DESCRIPTION: Renders a red box of size 89x107 starting at (52, 26).
; PLAN: r0=52(x), r1=26(y), r2=89(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 26
LDI r2, 89
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
