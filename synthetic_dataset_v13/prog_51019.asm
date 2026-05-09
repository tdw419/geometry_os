; DESCRIPTION: Renders a black box of size 82x33 starting at (316, 65).
; PLAN: r0=316(x), r1=65(y), r2=82(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 65
LDI r2, 82
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
