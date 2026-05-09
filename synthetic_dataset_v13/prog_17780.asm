; DESCRIPTION: Renders a black box of size 12x48 starting at (223, 11).
; PLAN: r0=223(x), r1=11(y), r2=12(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 11
LDI r2, 12
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
