; DESCRIPTION: Renders a black box of size 98x13 starting at (136, 214).
; PLAN: r0=136(x), r1=214(y), r2=98(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 214
LDI r2, 98
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
