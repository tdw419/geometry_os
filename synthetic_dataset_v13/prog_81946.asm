; DESCRIPTION: Renders a black box of size 39x47 starting at (341, 176).
; PLAN: r0=341(x), r1=176(y), r2=39(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 176
LDI r2, 39
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
