; DESCRIPTION: Renders a black box of size 31x29 starting at (148, 86).
; PLAN: r0=148(x), r1=86(y), r2=31(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 86
LDI r2, 31
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
