; DESCRIPTION: Composite: Renders a yellow box of size 98x50 starting at (290, 3) then Places a black dot at position (388, 182) then Renders a black disk with center (163, 187) and radius 43.
; PLAN: r0=290(x), r1=3(y), r2=98(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=182(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=163(x), r11=187(y), r12=43(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 3
LDI r2, 98
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 182
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 163
LDI r11, 187
LDI r12, 43
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
