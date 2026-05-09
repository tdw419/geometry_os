; DESCRIPTION: Renders a yellow box of size 105x12 starting at (354, 130).
; PLAN: r0=354(x), r1=130(y), r2=105(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 130
LDI r2, 105
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
