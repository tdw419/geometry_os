; DESCRIPTION: Renders a black box of size 111x19 starting at (324, 172).
; PLAN: r0=324(x), r1=172(y), r2=111(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 172
LDI r2, 111
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
