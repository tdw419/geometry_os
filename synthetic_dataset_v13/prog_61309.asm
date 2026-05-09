; DESCRIPTION: Composite: Renders a black box of size 115x112 starting at (386, 102) then Places a purple dot at position (169, 144).
; PLAN: r0=386(x), r1=102(y), r2=115(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x), r6=144(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 102
LDI r2, 115
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 144
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
