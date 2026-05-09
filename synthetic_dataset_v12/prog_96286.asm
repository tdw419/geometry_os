; DESCRIPTION: Renders a black box of size 38x73 starting at (190, 56).
; PLAN: r0=190(x), r1=56(y), r2=38(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 56
LDI r2, 38
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
