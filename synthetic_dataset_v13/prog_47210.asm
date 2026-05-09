; DESCRIPTION: Renders a black box of size 39x73 starting at (246, 109).
; PLAN: r0=246(x), r1=109(y), r2=39(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 109
LDI r2, 39
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
