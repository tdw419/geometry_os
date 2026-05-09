; DESCRIPTION: Renders a black box of size 115x37 starting at (204, 86).
; PLAN: r0=204(x), r1=86(y), r2=115(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 86
LDI r2, 115
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
