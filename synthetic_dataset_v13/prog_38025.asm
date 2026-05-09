; DESCRIPTION: Renders a black box of size 111x54 starting at (148, 176).
; PLAN: r0=148(x), r1=176(y), r2=111(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 176
LDI r2, 111
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
