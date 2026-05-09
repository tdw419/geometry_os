; DESCRIPTION: Renders a green box of size 31x107 starting at (78, 82).
; PLAN: r0=78(x), r1=82(y), r2=31(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 82
LDI r2, 31
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
