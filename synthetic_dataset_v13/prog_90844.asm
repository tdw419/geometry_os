; DESCRIPTION: Renders a black box of size 94x119 starting at (248, 130).
; PLAN: r0=248(x), r1=130(y), r2=94(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 130
LDI r2, 94
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
