; DESCRIPTION: Renders a green box of size 31x18 starting at (12, 137).
; PLAN: r0=12(x), r1=137(y), r2=31(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 137
LDI r2, 31
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
