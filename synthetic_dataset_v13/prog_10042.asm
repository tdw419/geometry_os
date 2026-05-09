; DESCRIPTION: Renders a yellow box of size 52x107 starting at (163, 38).
; PLAN: r0=163(x), r1=38(y), r2=52(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 38
LDI r2, 52
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
