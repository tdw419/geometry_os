; DESCRIPTION: Renders a black box of size 39x12 starting at (304, 114).
; PLAN: r0=304(x), r1=114(y), r2=39(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 114
LDI r2, 39
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
