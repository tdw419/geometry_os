; DESCRIPTION: Renders a black box of size 82x110 starting at (139, 27).
; PLAN: r0=139(x), r1=27(y), r2=82(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 27
LDI r2, 82
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
