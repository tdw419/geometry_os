; DESCRIPTION: Renders a black box of size 115x58 starting at (264, 177).
; PLAN: r0=264(x), r1=177(y), r2=115(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 177
LDI r2, 115
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
