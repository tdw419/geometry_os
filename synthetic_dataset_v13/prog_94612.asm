; DESCRIPTION: Renders a black box of size 111x104 starting at (183, 6).
; PLAN: r0=183(x), r1=6(y), r2=111(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 6
LDI r2, 111
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
