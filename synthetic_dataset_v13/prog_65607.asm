; DESCRIPTION: Renders a black box of size 45x74 starting at (245, 126).
; PLAN: r0=245(x), r1=126(y), r2=45(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 126
LDI r2, 45
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
