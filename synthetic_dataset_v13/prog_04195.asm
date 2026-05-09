; DESCRIPTION: Composite: Renders a green box of size 96x116 starting at (377, 46) then Places a magenta dot at position (71, 74) then Renders a black disk with center (241, 102) and radius 66.
; PLAN: r0=377(x), r1=46(y), r2=96(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x), r6=74(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=241(x), r11=102(y), r12=66(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 377
LDI r1, 46
LDI r2, 96
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 74
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 241
LDI r11, 102
LDI r12, 66
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
