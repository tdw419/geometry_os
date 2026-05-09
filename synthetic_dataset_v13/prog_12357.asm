; DESCRIPTION: Renders a yellow box of size 89x107 starting at (406, 71).
; PLAN: r0=406(x), r1=71(y), r2=89(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 71
LDI r2, 89
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
