; DESCRIPTION: Renders a yellow box of size 11x83 starting at (167, 45).
; PLAN: r0=167(x), r1=45(y), r2=11(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 45
LDI r2, 11
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
