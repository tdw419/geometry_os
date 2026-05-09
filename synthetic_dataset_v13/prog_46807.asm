; DESCRIPTION: Composite: Renders a black box of size 111x112 starting at (189, 21) then Places a white dot at position (453, 41) then Renders a red disk with center (66, 161) and radius 10.
; PLAN: r0=189(x), r1=21(y), r2=111(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x), r6=41(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=66(x), r11=161(y), r12=10(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 189
LDI r1, 21
LDI r2, 111
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 41
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 66
LDI r11, 161
LDI r12, 10
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
