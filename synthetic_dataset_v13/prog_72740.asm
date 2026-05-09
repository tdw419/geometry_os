; DESCRIPTION: Renders a black box of size 11x90 starting at (148, 130).
; PLAN: r0=148(x), r1=130(y), r2=11(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 130
LDI r2, 11
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
