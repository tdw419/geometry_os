; DESCRIPTION: Renders a black box of size 111x73 starting at (87, 102).
; PLAN: r0=87(x), r1=102(y), r2=111(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 102
LDI r2, 111
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
