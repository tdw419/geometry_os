; DESCRIPTION: Renders a yellow box of size 39x82 starting at (194, 109).
; PLAN: r0=194(x), r1=109(y), r2=39(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 109
LDI r2, 39
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
