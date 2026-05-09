; DESCRIPTION: Renders a black box of size 12x24 starting at (253, 192).
; PLAN: r0=253(x), r1=192(y), r2=12(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 192
LDI r2, 12
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
