; DESCRIPTION: Renders a black box of size 32x93 starting at (441, 15).
; PLAN: r0=441(x), r1=15(y), r2=32(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 15
LDI r2, 32
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
