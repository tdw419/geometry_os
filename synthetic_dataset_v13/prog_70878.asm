; DESCRIPTION: Renders a black box of size 49x28 starting at (441, 160).
; PLAN: r0=441(x), r1=160(y), r2=49(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 160
LDI r2, 49
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
